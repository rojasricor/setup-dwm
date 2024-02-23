#!/bin/bash

repopath=$(pwd)
echo $repopath

repos() {
  echo "Setting community repo, and searching fast repos..."
  sudo setup-apkrepos -cf
}
repos
w
echo "Updating system..."
sudo apk update
sudo apk upgrade

echo "Installing xorg..."
sudo setup-xorg-base

echo "Installing dependencies..."
sudo apk add git make gcc g++ libx11-dev libxft-dev libxinerama-dev ncurses dbus-x11 firefox-esr font-noto-emoji
# Ferdev27 dwm dotfiles dependencies
sudo apk add libxrandr-dev imlib2-dev linux-headers coreutils brightnessctl pulseaudio pulseaudio-alsa pulseaudio-utils scrot neofetch setxkbmap redshift font-ubuntu-mono-nerd font-noto-emoji libnotify dunst cbatticon volumeicon

installSucklessSoft() {
  echo "Installing suckless software via git..."
  cd /tmp || exit
  echo "Cloning dwm git repo..."
  git clone https://git.suckless.org/dwm
  cd dwm || exit
  echo "Installing dwm..."
  sudo make clean install
  cd ..
  echo "Cloning dmenu git repo..."
  git clone https://git.suckless.org/dmenu
  cd dmenu || exit
  echo "Installing dmenu..."
  sudo make clean install
  cd ..
  echo "Cloning st terminal git repo..."
  git clone https://git.suckless.org/st
  cd st || exit
  echo "Installing st terminal..."
  sudo make clean install
  cd ..
}

# installSucklessSoft

echo "Enter your username:.."
read usrname
echo "Setting xorg and starting initializing dwm basic config files..."
cd "$repopath" || exit
cp -r ./.profile ./.xinitrc "/home/$usrname"

addNeededGroups() {
  echo "Adding user: $usrname to needed groups..."
  sudo adduser "$usrname" wheel
  sudo adduser "$usrname" input
  sudo adduser "$usrname" audio
  sudo adduser "$usrname" video
}
addNeededGroups
