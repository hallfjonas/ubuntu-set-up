#!/bin/bash

##
## Install script for basic requirements.
##

sudo apt-get update

# git, vim, build essentials
sudo apt-get install -y git-all \
	vim \
	build-essential \
	manpages-dev \
	cmake \
	texlive-full \
	latexmk \
	libreoffice \
	cups \
	libxcb-xtest0 \
	libxcb-xinerama0 \
	libegl1-mesa			# required for zoom
	
# Git settings
echo "Enter global git user.email: "
read email

echo "Enter global git user.name: "
read name
git config --global user.email $email
git config --global user.name $name
git config --global core.editor "vim"

# VSCode
sudo snap install --classic code								
code --install-extension ms-vscode.cpptools							# CPP 
code --install-extension james-yu.latex-workshop					# Latex
code --install-extension streetsidesoftware.code-spell-checker		# Spell Checker
code --install-extension twxs.cmake									# Cmake

# Mattermost
sudo snap install mattermost-desktop --beta

# Valgrind (version >= 3.17)
sudo snap install --classic valgrind

# Zoom
cd ~
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
rm zoom_amd64.deb

# Set up LD config to recognize standard library paths
sudo ldconfig

