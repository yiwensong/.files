# all the stripe magic

if status --is-login; and status --is-interactive
    # Add the stripe tools paths
    set PATH $HOME/stripe/space-commander/bin $PATH
    set PATH $HOME/stripe/password-vault/bin $PATH
    set PATH $HOME/stripe/henson/bin $PATH
    set PATH $HOME/.rbenvs/shims $PATH
    set PATH $HOME/.rbenvs/bin $PATH

    # Activate the space-commander env
    source (rbenv init -|psub)
    source (nodenv init -|psub)
    source ~/stripe/space-commander/bin/sc-env-activate.fish
    functions -e fish_right_prompt
end
