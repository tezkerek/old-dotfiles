#!/bin/zsh

# ~ files
cp --parents ~/{.vimrc,.tmux.conf,.vimperatorrc,.xbindkeysrc,.xinitrc,.zshrc,.Xresources,.Xresources.d/*} ~/.dotfiles/

# .config
cp --parents ~/.config/{bspwm,sxhkd,yabar,termite}/* ~/.config/compton.conf ~/.dotfiles/
