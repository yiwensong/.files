if status --is-login; and status --is-interactive
    if not test -d ~/.emacs.d/emacs-for-python/
        # Installs emacs-for-python via github
        git clone --depth 1 https://github.com/gabrielelanaro/emacs-for-python.git ~/.emacs.d/emacs-for-python
    end
    
    if not test -d ~/.emacs.d/emacs-color-theme-solarized/
        # Installs emacs-color-theme-solarized
        git clone --depth 1 https://github.com/sellout/emacs-color-theme-solarized.git ~/.emacs.d/emacs-color-theme-solarized
    end
end
