function tmux-proj --description 'starts a tmux session for a stripe repo with sane defaults'
    set session_name $argv[1]

    if tmux ls | rg $session_name
        tmux a -t $session_name
        exit 0
    end

    if tmux ls
        set height (tmux display -p '#{window_height}')
        set width (tmux display -p '#{window_width}')
    else
        set height (tput lines)
        set width (tput cols)
    end

    echo $width x $height

    tmux new-session -d -s $session_name -c $HOME/stripe/$session_name -x $width -y $height
    tmux rename-window -t $session_name:1 $session_name
    tmux split-window -h -t $session_name:$session_name.1
    tmux resize-pane -t $session_name:$session_name.1 -x 100
    tmux attach -t $session_name
end
