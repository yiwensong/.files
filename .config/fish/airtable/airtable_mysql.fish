if status --is-login
    status --file
    set -gx PATH "/usr/local/mysql/bin" $PATH
end
