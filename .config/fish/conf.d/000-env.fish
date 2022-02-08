# General environment variables

if status --is-login
    if not test -d $HOME/.config
        mkdir $HOME/.config
    end
    set XDG_CONFIG_HOME $HOME/.config

    if not test -d $HOME/.cache
        mkdir $HOME/.cache
    end
    set XDG_CONFIG_CACHE $HOME/.cache

    # Set default editor
    set EDITOR "nvim"
    # Uncomment this if you hate yourself
    # set EDITOR "emacs"
    
    # clear the current path
    set -e fish_user_paths

    # Add stuff to your PATH
    set fish_user_paths $HOME/.local/bin $fish_user_paths
    set fish_user_paths /usr/lib/go-1.9/bin $fish_user_paths
    set fish_user_paths $HOME/.venv/bin $fish_user_paths
    set fish_user_paths $GOPATH/bin $fish_user_paths
    set fish_user_paths $HOME/.cargo/bin $fish_user_paths
    set fish_user_paths $HOME/bin/.fzf/bin $fish_user_paths

    # gnu packages because osx ones are bad apparently
    set fish_user_paths /usr/local/opt/gnu-sed/libexec/gnubin $fish_user_paths
    set fish_user_paths /usr/local/opt/gnu-tar/libexec/gnubin $fish_user_paths

    # apple silicon brew
    if test (uname -m) = "arm64"
        set fish_user_paths /opt/homebrew/bin $fish_user_paths
    end

    if not test -d $HOME/.local
        mdkir $HOME/.local
    end
    if not test -d $HOME/.local/bin
        mkdir $HOME/.local/bin
    end
    if not test -d $HOME/.local/data
        mkdir $HOME/.local/data
    end

    set IS_LOCAL 0
    set local_ids C02V20DBHTD8 YSONG121849
    set IS_LOCAL 0
    for id in $local_ids
      if [ (hostname) = $id ]
        set IS_LOCAL 1
        break
      end
    end

end
