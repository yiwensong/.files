#!/usr/bin/fish
set confdir (pwd)"/"(dirname (status -f))

# remove old configs
rm -rf $HOME/.config/fish
rm -rf $HOME/.vimrc
rm -rf $HOME/.tmux.conf

# make a ~/.config folder if not there
if not test -d $HOME/.config
  mkdir $HOME/.config
end

# softlink them to this directory
ln -s $confdir/.config/fish $HOME/.config/fish
ln -s $confdir/.vimrc $HOME/.vimrc
ln -s $confdir/.tmux.conf $HOME/.tmux.conf
