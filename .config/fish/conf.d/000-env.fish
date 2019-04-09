# General environment variables

if status --is-login
    # Set default editor
    set EDITOR "nvim"
    # Uncomment this if you hate yourself
    # set EDITOR "emacs"
    
    # Add stuff to your PATH
    set PATH $HOME/.local/bin $PATH
    set PATH /usr/lib/go-1.9/bin $PATH
    set PATH $HOME/.venv/bin $PATH
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
