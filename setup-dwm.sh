echo "Activate root superuser access:.."
su

echo "Setting comunity repo, and searching fast repos..."
setup-apkrepos -cf

echo "Updating system..."
apk update && sudo apt upgrade

echo "Installing utils: neofetch, redshift..."
apk add neofetch redshift

echo "Installing xorg..."
setup-xorg-base

echo "Installing dependencies..."
apk add git make gcc g++ libx11-dev libxft-dev libxinerama-dev ncurses dbus-x11 chromium font-noto-emoji

echo "Installing suckless software by git..."
cd /tmp
echo "Clonning dwm git repo..."
git clone https://git.suckless.org/dwm
cd dwm
echo "Installing dwm..."
make clean install
cd ..
echo "Clonning dmenu git repo..."
git clone https://git.suckless.org/dmenu
cd dmenu
echo "Installing dmenu..."
make clean install
cd ..
echo "Clonning st terminal git repo..."
git clone https://git.suckless.org/st
cd st
echo "Installing st terminal..."
make clean install

echo "Exiting from root user..."
exit
echo "Setting xorg and start init dwm basic config files..."
mv .profile .xinitrc ~/

