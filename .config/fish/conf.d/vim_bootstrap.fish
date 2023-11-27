if status --is-login; and status --is-interactive
    status --file
    head -n 250 $HOME/.config/nvim/init.vim > $HOME/.config/nvim/init_bootstrap.vim
    if not test -e $HOME/.local/share/nvim/site/autoload/plug.vim
        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    end

    eval "nvim -u $HOME/.config/nvim/init_bootstrap.vim -c 'silent! PlugInstall' -c 'qa'"

    if not test -d $HOME/.local/share/nvim/undo
        mkdir $HOME/.local/share/nvim/undo
    end
    if not test -d $HOME/.local/share/nvim/swap
        mkdir $HOME/.local/share/nvim/swap
    end
end
