#!/bin/sh
if [ -f /etc/fedora-release ]; then
	sudo dnf install -y vim
elif [ -f /etc/lsb-release ] || [ -f /etc/os-release ] ; then
	sudo apt-get update
	sudo apt-get install -y vim
else
	echo "Unsupported distribution. This script only supports Fedora and Ubuntu."
	exit 1
fi
rm -rf "$HOME"/.vim
git clone https://github.com/Ant0wan/vim-plugin/ "$HOME"/.vim/
echo "Vim has been successfully installed."
