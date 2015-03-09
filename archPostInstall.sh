#! /bin/sh

# Virtualbox setup. Comment out if using this for a non-vm install
pacman -S virtualbox-guest-utils
vboxguest > /etc/modules-load.d/virtualbox.conf
vboxsf >> /etc/modules-load.d/virtualbox.conf
vboxvideo >> /etc/modules-load.d/virtualbox.conf
VBoxClient-all
# Get xorg packages. xorg-twm can be uninstalled after confirmation of correct install
pacman -S xorg-server xorg-server-utils xterm xorg-twm xorg-xinit
