if status --is-login; and status --is-interactive; and not type -q fzf
    # Install fzf via github
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --update-rc --no-zsh
end

set FZF_DEFAULT_OPTS '--color=light'
set FZF_DEFAULT_COMMAND 'fd --type file'
