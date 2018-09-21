function _install_ycm
    set WORKDIR (pwd)
    if not test -d $HOME/.local/data
      mkdir $HOME/.local/data
    end
    curl -fLo $HOME/.local/data/cmake-3.10.1.tar.gz https://cmake.org/files/v3.10/cmake-3.10.1.tar.gz
    cd $HOME/.local/data/
    tar -xvf cmake-3.10.1.tar.gz
    cd $HOME/.local/data/cmake-3.10.1
    ./bootstrap --prefix=$HOME/.local ; and make ; and make install
    eval $HOME/.vim/plugged/YouCompleteMe/install.py --js-completer --clang-completer --system-libclang --go-completer
    cd $WORKDIR
end

if status --is-login; and status --is-interactive
    head -n 100 $HOME/.vimrc > $HOME/.vimrc_bootstrap
    if not test -e ~/.vim/autoload/plug.vim
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    end
    if type -q vim8
        eval "vim8 -u $HOME/.vimrc_bootstrap -c 'silent! PlugInstall' -c 'qa'"
    else
        eval "vim -u $HOME/.vimrc_bootstrap -c 'silent! PlugInstall' -c 'qa'"
    end
    if not test -d ~/.vim/undo
        mkdir ~/.vim/undo
    end
    if not test -d ~/.vim/swapfiles
        mkdir ~/.vim/swapfiles
    end
end
