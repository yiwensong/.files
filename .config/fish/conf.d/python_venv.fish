if status --is-login; and status --is-interactive
    if not test -e ~/.venv/bin
        python3 -m virtualenv --python=python3 ~/.venv
        ~/.venv/bin/pip3 install ipython
    end
    pip3 install jedi
end
