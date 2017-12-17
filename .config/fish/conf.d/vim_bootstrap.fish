if status --is-login; and status --is-interactive
    if not test -e ~/.vim/autoload/plug.vim
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    end
    vim -c \'silent! PlugInstall\' -c \'qa\'
    cd ~/.vim/plugged/YouCompleteMe/
    ./install.py
end
