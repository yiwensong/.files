if status --is-login; and status --is-interactive
    status --file
    if test (uname -m) = "arm64"
        set pypath /opt/homebrew/bin
    else
        set pypath /usr/local/bin
    end

    if not test -e $HOME/.venv/bin
        $pypath/pip3 install virtualenv
        $pypath/python3 -m virtualenv --python=python3 $HOME/.venv
        $HOME/.venv/bin/pip3 install ipython
    end
    $HOME/.venv/bin/pip3 install jedi
    $HOME/.venv/bin/pip3 install neovim
end
