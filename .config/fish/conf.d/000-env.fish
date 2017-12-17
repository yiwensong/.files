# General environment variables

if status --is-login
    # Set default editor
    set EDITOR "vim"
    # Uncomment this if you hate yourself
    # set EDITOR "emacs"
    
    # Add stuff to your PATH
    set PATH $HOME/.local/bin $PATH
    if test -d $HOME/.local
        mdkir $HOME/.local
    end
    if test -d $HOME/.local/bin
        mkdir $HOME/.local/bin
    end
    if test -d $HOME/.local/data
        mkdir $HOME/.local/data
    end
end
