function tmux-pay --description 'starts a tmux session for pay-server'
    set session_name pay-server
    set main_pane_name pay
    set side_pane_name "pay up"

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

    tmux new-session -d -s $session_name -c $HOME/stripe/pay-server -x $width -y $height
    tmux rename-window -t $session_name:1 $main_pane_name
    tmux split-window -h -t $session_name:$main_pane_name.1
    tmux resize-pane -t $session_name:$main_pane_name.1 -x 100

    tmux new-window -t $session_name -n $side_pane_name
    tmux split-window -h -t $session_name:$side_pane_name.1
    tmux resize-pane -t $session_name:$side_pane_name.1 -x 100
end
