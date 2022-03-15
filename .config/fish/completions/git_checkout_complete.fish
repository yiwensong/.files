function __fzf_complete_git_checkout
    set -l last_arg (string trim (commandline -t))
    cat | fzf --query="$last_arg" $argv
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

complete \
    --no-files \
    --command 'git' \
    --condition '__fish_git_using_command checkout' \
    --arguments="(git branch --format=\"%(refname)\" --no-color 2>&1 | __fzf_complete_git_checkout)"
