#!/bin/bash

sudo add-apt-repository  -y ppa:gottcode/gcppa
#sudo add-apt-repository -y ppa:tiheum/equinox
sudo apt-get -q -y update

PKGS="  vim vim-gnome"
PKGS+=" git mercurial subversion" 
PKGS+=" git-gui gitk meld"
PKGS+=" cmake build-essential"
PKGS+=" checkinstall"
PKGS+=" tmux zsh xsel xclip guake"
PKGS+=" exuberant-ctags cscope"
PKGS+=" openssh-server"
PKGS+=" wget curl"
PKGS+=" python-setuptools"
PKGS+=" speedcrunch"
PKGS+=" chromium-browser"
PKGS+=" xfce4-whiskermenu-plugin"
PKGS+=" cu realpath"
PKGS+=" vlc"
#PKGS+=" faenza-icon-theme"

sudo apt-get -q -y install $PKGS

# python dev
sudo easy_install pip
PIP="  virtualenv" 
PIP+=" pep8 nose pysmell"
PIP+=" ipython"
sudo pip install $PIP

