if status --is-login; and status --is-interactive
    if not test -e ~/.vim/autoload/plug.vim
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    end
    if not test -d ~/.vim/plugged/YouCompleteMe
        set YCM_NEEDS_INSTALL 1
    else
        set YCM_NEEDS_INSTALL 0
    end
    vim -c \'silent! PlugInstall\' -c \'qa\'
    if test $YCM_NEEDS_INSTALL = "1"
        cd $HOME/.local/data
        curl -fLo $HOME/.local/data https://cmake.org/files/v3.10/cmake-3.10.1.tar.gz
        cd cmake-3.10.1
        ./bootstrap --prefix $HOME/.local/bin ; and make ; and make install
        cd $HOME/.vim/plugged/YouCompleteMe/
        ./install.py
        cd $HOME
    end
    if not test -d ~/.vim/undo
        mkdir ~/.vim/undo
    end
    if not test -d ~/.vim/swapfiles
        mkdir ~/.vim/swapfiles
    end
end
