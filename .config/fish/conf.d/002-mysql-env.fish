# add mysql to PATH

if status --is-login
    status --file
    set fish_user_paths /usr/local/mysql/bin $fish_user_paths
end
