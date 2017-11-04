#!/bin/zsh

# ~ files
cp -r ~/{.vimrc,.tmux.conf,.vimperatorrc,.xbindkeysrc,.xinitrc,.zshrc,.Xresources,.Xresources.d} ~/.dotfiles/

# .config
cp -r ~/.config/{bspwm,sxhkd,termite,rofi,compton.conf} ~/.dotfiles/config/

# .scripts
cp -r ~/.scripts/ ~/.dotfiles/scripts
