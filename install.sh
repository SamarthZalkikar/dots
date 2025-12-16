#!/bin/bash

echo "Samarth Dots"
echo "Do you want to install yay? [yes/no]"

read a

if [ "$a" == "yes" ]; then
  echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si
else
  echo "Not installing yay"
fi

echo "Do you want to install dot files? [yes/no]"
read b

if [ "$b" == "yes" ]; then
  echo "Backing up old dots..."
  cd ~
  cp -r "/home/$(whoami)/.config" "/home/$(whoami)/.config.bak"
  mv "/home/$(whoami)/.config" "/home/$(whoami)/.config.bak"
  echo "Cloning dot files..."
  git clone https://github.com/SamarthZalkikar/archlinux_dotfiles
  cd archlinux_dotfiles
  mv .config "/home/$(whoami)/.config"
  mv tmux.config .tmux.config
  mv .tmux.config ~

  echo "Installation Complete...."

else
  echo "Aborting Installation..."
fi
