echo "Setting comunity repo, and searching fast repos..."
sudo setup-apkrepos -cf

echo "Updating system..."
sudo apk update && sudo apt upgrade

echo "Installing xorg..."
sudo setup-xorg-base

echo "Installing dependencies..."
sudo apk add git make gcc g++ libx11-dev libxft-dev libxinerama-dev ncurses dbus-x11 chromium

echo "Installing suckless software by git..."
cd /tmp
echo "Clonning dwm git repo..."
git clone https://git.suckless.org/dwm
cd dwm
echo "Installing dwm..."
sudo make clean install
cd ..
echo "Clonning dmenu git repo..."
git clone https://git.suckless.org/dmenu
cd dmenu
echo "Installing dmenu..."
sudo make clean install
cd ..
echo "Clonning st terminal git repo..."
git clone https://git.suckless.org/st
cd st
echo "Installing st terminal..."
sudo make clean install
cd ~
