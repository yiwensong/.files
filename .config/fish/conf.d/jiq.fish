if status --is-login; and status --is-interactive; and not type -q jiq
    # install jiq with go get
    go get github.com/fiatjaf/jiq/cmd/jiq
    ln -s $HOME/go/bin/jiq $HOME/.local/bin/jiq
end
