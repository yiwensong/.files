if status --is-login; and status --is-interactive; and not type -q jiq
    # install gocode with go get
    go get -u github.com/nsf/gocode
end
