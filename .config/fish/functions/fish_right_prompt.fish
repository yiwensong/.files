function fish_right_prompt -d "write right prompt"
    set -l exit_code $status
    set -l is_git_repository (git rev-parse --is-inside-work-tree 2>/dev/null)

    if test -n "$is_git_repository"

        if test (git stash list | wc -l) -gt 0
            echo -n "🥑  "
        end

        git rev-parse --abbrev-ref '@{upstream}' >/dev/null 2>/dev/null; and set -l has_upstream
        if set -q has_upstream
            set commit_counts (git rev-list --left-right --count 'HEAD...@{upstream}' 2>/dev/null)
            set -l to_push (echo -n $commit_counts | cut -f 1 2>/dev/null)
            set -l to_pull (echo -n $commit_counts | cut -f 2 2>/dev/null)
            echo -n "(☝️ $to_push "
            echo -n "👇 $to_pull)"
        end

        set -l branch (git symbolic-ref --short HEAD 2>/dev/null; or git show-ref --head -s --abbrev | head -n1 2>/dev/null)

        git diff-files --quiet --ignore-submodules 2>/dev/null; or set -l has_unstaged_files
        git diff-index --quiet --ignore-submodules --cached HEAD 2>/dev/null; or set -l has_staged_files

        set_color brwhite
        echo -n "🌲 "$branch" "
        set_color normal

        if set -q has_unstaged_files
            echo -n "😡 "
        else if set -q has_staged_files
            echo -n "🤔 "
        else
            echo -n "😎 "
        end
    end

    echo ""

end
