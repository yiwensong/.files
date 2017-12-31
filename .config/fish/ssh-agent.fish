if status --is-login; and status --is-interactive
    if test -z "$SSH_ENV"
        set -xg SSH_ENV $HOME/.ssh/environment
    end

    if not __ssh_agent_is_started
        __ssh_agent_start
    end

    set $SSH_IDS gcloud_rsa id_rsa yiws
    for id in $SSH_IDS
        ssh-add ~/.ssh/$id
    end
end
