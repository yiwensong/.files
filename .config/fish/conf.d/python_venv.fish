if status --is-login; and status --is-interactive
    if not test -e $HOME/.venv/bin
        /usr/local/bin/pip3 install virtualenv
        /usr/local/bin/python3 -m virtualenv --python=python3 $HOME/.venv
        $HOME/.venv/bin/pip3 install ipython
    end
    $HOME/.venv/bin/pip3 install jedi
    $HOME/.venv/bin/pip3 install neovim
end
