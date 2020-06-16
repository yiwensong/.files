function fish_prompt
    set __prompt_status $status
    set sblue (set_color brblue)
    set syell (set_color yellow)
    set snorm (set_color normal)
    set sbrwt (set_color brmagenta)
    set sbryl (set_color yellow)
    set sbrgr (set_color cyan)
    # echo $sblue"["$sbryl(whoami)$sblue"@"$sbrwt(hostname) $snorm(date +%H:%M:%S)$sblue] $sbryl(prompt_pwd)
    # echo $snorm"\$ "

    # set local_ids C02V20DBHTD8 YSONG121849

    # set user "$sbryl"(whoami)"$snorm"
    # set islocal 0
    # for id in $local_ids
    #   if [ (hostname) = $id ]
    #     set islocal 1
    #     break
    #   end
    # end

    if [ $IS_LOCAL = 1 ]
      set user "$sbrgr"(whoami)"$snorm"
    else
      set user "$sbryl"(whoami)"$snorm"
    end
    set host "$sbrwt"(hostname)"$snorm"
    set tstamp "$snorm"(date +%H:%M:%S)"$snorm"
    set path "$sbryl"(prompt_pwd)"$snorm"

    printf "%s[%s%s@%s %s%s] %s%s%s\n%s" $sblue $user $sblue $host $tstamp $sblue $path $snorm
    if test $__prompt_status -ne 0
        __fail_emoji
    else
        __success_emoji
    end
end


function __success_emoji -d "makes a success emoji"
    set rand (random)
    set big 32767
    if test $rand -lt (echo $big"/5" | bc)
        printf "> \n"
    else if test $rand -lt (echo $big"*2/5" | bc)
        printf "> \n"
    else if test $rand -lt (echo $big"*3/5" | bc)
        printf "> \n"
    else if test $rand -lt (echo $big"*4/5" | bc)
        printf "> \n"
    else
        printf "> \n"
    end
end


function __fail_emoji -d "makes a failure emoji"
    printf "! \n"
end

function fish_right_prompt -d "write right prompt"
    set -l exit_code $status
    set -l is_git_repository (git rev-parse --is-inside-work-tree 2>/dev/null)
    set -l is_bare_repo (git rev-parse --is-bare-repository 2>/dev/null)

    if test -n "$is_git_repository"; and test $is_bare_repo = false

        if test (git stash list | wc -l) -gt 0
            echo -n "= "
        end

        git rev-parse --abbrev-ref '@{upstream}' >/dev/null 2>/dev/null; and set -l has_upstream
        if set -q has_upstream
            set commit_counts (git rev-list --left-right --count 'HEAD...@{upstream}' 2>/dev/null)
            set -l to_push (echo -n $commit_counts | cut -f 1 2>/dev/null)
            set -l to_pull (echo -n $commit_counts | cut -f 2 2>/dev/null)
            echo -n "(^ $to_push "
            echo -n "v $to_pull)"
        end

        set -l branch (git symbolic-ref --short HEAD 2>/dev/null; or git show-ref --head -s --abbrev | head -n1 2>/dev/null)

        git diff-files --quiet --ignore-submodules 2>/dev/null; or set -l has_unstaged_files
        git diff-index --quiet --ignore-submodules --cached HEAD 2>/dev/null; or set -l has_staged_files

        set_color brwhite
        echo -n "br "$branch" "
        set_color normal

        if set -q has_unstaged_files
            echo -n "unclean "
        else if set -q has_staged_files
            echo -n "staged "
        else
            echo -n "clean "
        end
    end
end
