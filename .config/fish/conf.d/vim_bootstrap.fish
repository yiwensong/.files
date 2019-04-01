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
