#!/bin/zsh

# ~ files
cp -r ~/{.vimrc,.tmux.conf,.vimperatorrc,.xbindkeysrc,.xinitrc,.zshrc,.Xresources,.Xresources.d} ~/.dotfiles/

# .config
cp -r ~/.config/{bspwm,sxhkd,termite,lemonbar,compton.conf} ~/.dotfiles/.config/
