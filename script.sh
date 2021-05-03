#!/bin/bash
sudo apt-get update

# git, vim, build essentials
sudo apt-get install -y git-all \
	vim \
	build-essential \
	manpages-dev \
	cmake \
	texlive-base \
	libreoffice
	
# Git settings
git config --global user.email "hall.f.jonas@gmail.com"
git config --global user.name "Jonas Hall"

# VSCode
sudo snap install --classic code
code --install-extension ms-vscode.cpptools
code --install-extension james-yu.latex-workshop

# Mattermost
sudo snap install mattermost-desktop --beta

# Valgrind (version >= 3.17)
sudo snap install --classic valgrind

# Clone gitlab repos
cd ~
git clone --recurse-submodules -j8 https://gitlab.syscop.de/jonas.hall/lcqpOASES
git clone https://gitlab.syscop.de/jonas.hall/worktime

# Install ACADOS
cd ~
git clone --recurse-submodules -j8 https://github.com/acados/acados.git
mkdir -p acados/build
cd acados/build
cmake ..
sudo make install

# Install CasADi for MATLAB
cd ~
mkdir -p casadi-matlab2014b-v3.5.5
cd casadi-matlab2014b-v3.5.5
wget https://github.com/casadi/casadi/releases/download/3.5.5/casadi-linux-matlabR2014b-v3.5.5.tar.gz
tar -xf casadi-linux-matlabR2014b-v3.5.5.tar.gz
rm casadi-linux-matlabR2014b-v3.5.5.tar.gz

