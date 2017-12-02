if status --is-login; and status --is-interactive; and not test -d ~/.emacs.d/emacs-for-python/
    # Installs emacs-for-python via github
    git clone --depth 1 https://github.com/gabrielelanaro/emacs-for-python.git ~/.emacs.d/emacs-for-python
end
