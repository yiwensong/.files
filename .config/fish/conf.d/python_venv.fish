if status --is-login; and status --is-interactive
    status --file
    if test (uname -m) = "arm64"
        set pypath /opt/homebrew/bin
    else
        set pypath /usr/local/bin
    end

    if test -n virtualenv; and not test -n brew
        brew install virtualenv
    else if test -n virtualenv
        echo "brew is not installed, skipping virtualenv"
        return 1
    end

    if not test -e $HOME/.venv/bin
        # $pypath/pip3 install virtualenv
        # $pypath/python3 -m virtualenv --python=python3 $HOME/.venv
        #
        # use brew virtualenv bc it's easier
        virtualenv --python=python3 $HOME/.venv
        $HOME/.venv/bin/pip3 install ipython
    end
    $HOME/.venv/bin/pip3 install jedi
    $HOME/.venv/bin/pip3 install neovim
end
