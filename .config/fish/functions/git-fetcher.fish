function git-fetcher
    for repo in (ls "$HOME"/stripe/)
        git --git-dir "$HOME"/stripe/"$repo"/.git fetch origin 2>&1 >/dev/null
    end
end
