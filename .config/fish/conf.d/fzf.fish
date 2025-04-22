if status --is-login; and status --is-interactive; and not type -q fzf
    status --file
    # Install fzf via github
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --update-rc --no-zsh
end

if not type -q fzf_key_bindings
    set keybindings (mktemp)
    fzf --fish > $keybindings
    source $keybindings
end

set FZF_DEFAULT_OPTS '--color=light'
set FZF_DEFAULT_COMMAND 'fd --type file'
set FZF_CTRL_T_COMMAND 'fd'
set FZF_ALT_C_COMMAND 'fd --type directory'
