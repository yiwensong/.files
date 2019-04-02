if status --is-login; and status --is-interactive
    if not test -e $HOME/.venv/bin
        python3 -m virtualenv --python=python3 ~/.venv
        $HOME/.venv/bin/pip3 install ipython
    end
    $HOME/.venv/bin/pip3 install jedi
end
