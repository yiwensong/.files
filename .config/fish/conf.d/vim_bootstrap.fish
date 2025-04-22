if status --is-login; and status --is-interactive
    # check if proxy is needed
    function with_proxy_env
        if type --query fwdproxy-config
            env (fwdproxy-config  --format=sh curl) $argv
        else
            env $argv
        end
    end

    status --file
    head -n 250 $HOME/.config/nvim/init.vim > $HOME/.config/nvim/init_bootstrap.vim
    if not test -e $HOME/.local/share/nvim/site/autoload/plug.vim
        with_proxy_env curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    end

    eval "with_proxy_env nvim -u $HOME/.config/nvim/init_bootstrap.vim -c 'silent! PlugInstall' -c 'qa'"

    if not test -d $HOME/.local/share/nvim/undo
        mkdir $HOME/.local/share/nvim/undo
    end
    if not test -d $HOME/.local/share/nvim/swap
        mkdir $HOME/.local/share/nvim/swap
    end
end
