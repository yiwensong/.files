# meta env

if status --is-login
    # mars cli
    set fish_user_paths $HOME/fbsource/fbcode/wearables/power/mars-serial/mars $fish_user_paths
    # medusa
    set fish_user_paths $HOME/fbsource/arvr/projects/medusa $fish_user_paths
    # mpsh
    set fish_user_paths $HOME/fbsource/fbcode/milan/power/mpsh $fish_user_paths
end
