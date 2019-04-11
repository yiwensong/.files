set ALL_REPOS $HOME/.github
set OUTPUT $ALL_REPOS/all_repos
set GITHUB_URL 'http://git.corp.stripe.com'

function get_url_from_response
    set tmpfile $argv[1]
    set url ( \
        cat $tmpfile | \
        grep Link | \
        grep next | \
        perl -pe 's/,/\n/g' | \
        grep next | \
        sed 's/Link: <//' | \
        sed 's/ <//' | \
        sed 's/>;.*//' | \
        sed 's/https/http/')
    echo $url
end

function get_response
    set tmpfile $argv[1]
    cat $tmpfile | grep -v '^\w' | jq -c . | sed 's/^{.*}$//'
end

function curl_to_tmpfile
    set url $argv[1]
    set tmpfile /tmp/(echo $url | sed 's!/!%!g')
    set token (cat $ALL_REPOS/autocomplete_token)
    curl \
        --include \
        --user $USER:$token \
        --silent \
        --unix-socket $HOME/.stripeproxy \
        $url \
        > $tmpfile
    echo $tmpfile
end

function fill_user_repos
    set url $GITHUB_URL/api/v3/user/repos
    while not test -z $url
        echo $url
        set tmpfile (curl_to_tmpfile $url)
        set url (get_url_from_response $tmpfile)
        set body (get_response $tmpfile)
        rm -rf $tmpfile
        set full_names (echo $body | jq -r '.[] .full_name' | perl -pe 's/ /\n/g')
        for full_name in $full_names
            echo $full_name | \
                sed 's/^/git@git.corp.stripe.com:/' | \
                sed 's/$/.git/' >> $OUTPUT
        end
    end
end

function fill_all_repos
    set timer $ALL_REPOS/last_write
    set today (date '+%Y%m%d')
    if test -f $timer
        set last_update (cat $timer)
    end

    if not test -z $last_update
        echo "Github repos last synced $last_update."
    else
        echo 'Github repos not synced.'
    end

    if not test -z $last_update; and test (math $today - $last_update) -le 0
        echo 'Not resyncing github repos.'
        return
    end

    echo 'Syncing Github repos...'

    rm -rf $OUTPUT

    fill_user_repos

    sort $OUTPUT | uniq > $OUTPUT.tmp

    mv $OUTPUT.tmp $OUTPUT
    rm -rf $OUTPUT.tmp


    echo 'Github all-repos sync done.'
    echo $today > $timer
end

if status --is-login
    fill_all_repos
end

function __fish_git_using_command
    set cmd (commandline -opc)
    contains -- $cmd $argv
    and return 0
    # Check aliases.
    set -l varname __fish_git_alias_(string escape --style=var -- $cmd)
    set -q $varname
    and contains -- $$varname $argv
    and return 0
    return 1
end

function __fzf_complete_git_clone
    set  -l last_arg (string trim (commandline -t))
    cat | fzf --query="$last_arg" $argv
end

complete \
    --no-files \
    --command 'git' \
    --condition '__fish_git_using_command clone' \
    --arguments="(cat $OUTPUT | __fzf_complete_git_clone)"
