# Go environment

if status --is-login
    status --file

    set -x -U GOPATH $HOME/go
end
