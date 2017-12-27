function _install_ycm
    set WORKDIR (pwd)
    if not test -d $HOME/.local/data
      mkdir $HOME/.local/data
    end
    curl -fLo $HOME/.local/data/cmake-3.10.1.tar.gz https://cmake.org/files/v3.10/cmake-3.10.1.tar.gz
    cd $HOME/.local/data/
    tar -xvf cmake-3.10.1.tar.gz
    cd $HOME/.local/data/cmake-3.10.1
    ./bootstrap --prefix=$HOME/.local/bin ; and make ; and make install
    eval $HOME/.vim/plugged/YouCompleteMe/install.py
    cd $WORKDIR
end

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
    eval vim -c \'silent! PlugInstall\' -c \'qa\'
    if test $YCM_NEEDS_INSTALL = "1"
        _install_ycm
    end
    if not test -d ~/.vim/undo
        mkdir ~/.vim/undo
    end
    if not test -d ~/.vim/swapfiles
        mkdir ~/.vim/swapfiles
    end
end
