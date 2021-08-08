#!/usr/bin/env fish
set confdir (pwd)"/"(dirname (status -f))

# move old configs
set backup_no 0
set backup_folder $HOME/.dot-files-backup.$backup_no
while test -d $backup_folder
    set backup_no (math $backup_no + 1)
    set backup_folder $HOME/.dot-files-backup.$backup_no
end
mkdir $backup_folder

if test -d $HOME/.config/fish
    mv $HOME/.config/fish $backup_folder
end

if test -f $HOME/.vimrc
    mv $HOME/.vimrc $backup_folder
end

if test -f $HOME/.tmux.conf
    mv $HOME/.tmux.conf $backup_folder
end

if test -f $HOME/.pryrc
    mv $HOME/.pryrc $backup_folder
end

# make a ~/.config folder if not there
if not test -d $HOME/.config
    mkdir $HOME/.config
end

# softlink them to this directory
ln -s $confdir/.config/fish $HOME/.config/fish
ln -s $confdir/.config/nvim $HOME/.config/nvim
ln -s $confdir/.vimrc $HOME/.vimrc
ln -s $confdir/.tmux.conf $HOME/.tmux.conf
ln -s $confdir/.pryrc $HOME/.pryrc
