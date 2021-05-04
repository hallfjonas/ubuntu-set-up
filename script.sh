#!/bin/bash

##
## Install script for basic requirements. Run this with sudo privileges.
##

apt-get update

# git, vim, build essentials
apt-get install -y git-all \
	vim \
	build-essential \
	manpages-dev \
	cmake \
	texlive-base \
	libreoffice \
	cups \
	libxcb-xtest0 \
	libxcb-xinerama0
	
# Git settings
git config --global user.email "hall.f.jonas@gmail.com"
git config --global user.name "Jonas Hall"

# VSCode
snap install --classic code
code --install-extension ms-vscode.cpptools
code --install-extension james-yu.latex-workshop

# Mattermost
snap install mattermost-desktop --beta

# Valgrind (version >= 3.17)
snap install --classic valgrind

# Clone gitlab repos
cd ~
git clone --recurse-submodules -j8 https://gitlab.syscop.de/jonas.hall/lcqpOASES

# Private repo: tracking work time
# git clone https://gitlab.syscop.de/jonas.hall/worktime

# Install/Download ACADOS
cd ~
git clone --recurse-submodules -j8 https://github.com/acados/acados.git
# mkdir -p acados/build
# cd acados/build
# cmake ..
# make install

# Install CasADi for MATLAB
cd ~
mkdir -p casadi-matlab2014b-v3.5.5
cd casadi-matlab2014b-v3.5.5
wget https://github.com/casadi/casadi/releases/download/3.5.5/casadi-linux-matlabR2014b-v3.5.5.tar.gz
tar -xf casadi-linux-matlabR2014b-v3.5.5.tar.gz
rm casadi-linux-matlabR2014b-v3.5.5.tar.gz

# Zoom
cd ~
wget https://zoom.us/client/latest/zoom_amd64.deb
dpkg -i zoom_amd64.deb
rm zoom_amd64.deb

