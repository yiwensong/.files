function tmux-proj --description 'starts a tmux session with sane defaults'
    set session_name $argv[1]
    set session_path $HOME/stripe/$session_name

    if tmux ls | rg "$session_name"":"
        if test -z $TMUX
            tmux attach -t $session_name
        else
            tmux switch-client -t $session_name
        end
        return
    end

    if tmux ls
        set height (tmux display -p '#{window_height}')
        set width (tmux display -p '#{window_width}')
    else
        set height (tput lines)
        set width (tput cols)
    end

    echo $width x $height

    tmux new-session -d -s $session_name -c $session_path -x $width -y $height
    tmux rename-window -t $session_name:1 $session_name
    tmux split-window -h -t $session_name:$session_name.1 -c $session_path
    tmux resize-pane -t $session_name:$session_name.1 -x 100

    if test -z $TMUX
        tmux attach -t $session_name:$session_name.1
    else
        tmux switch-client -t $session_name:$session_name.1
    end
end
