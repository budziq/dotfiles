#!/usr/bin/env bash

source lib.sh

bot "Lets setup some dotfiles. Here we go..."

# make a backup directory for overwritten dotfiles
if [[ ! -e ~/.dotfiles_backup ]]; then
    mkdir ~/.dotfiles_backup
fi

echo $0 | grep zsh > /dev/null 2>&1 | true
if [[ ${PIPESTATUS[0]} != 0 ]]; then
    running "changing your login shell to zsh"
    chsh -s $(which zsh);ok
else
    bot "looks like you are already using zsh!"
fi

# Ask for the administrator password upfront
bot "I need you to enter your sudo password so I can install some things:"
sudo -v

bot "installing apt packages..."
require_apt guake
require_apt vim
require_apt python-setuptools
require_apt gitk
require_apt git
#require_apt not_exist
bot "seting-up python pip..."
    #run cat /etc/shadow
    srun easy_install pip
bot "installing python pip packages..."
#require_pip
bot "misc package setup..."
# setup guake colors and settings
#./local.sh

pushd ~ > /dev/null 2>&1

bot "creating symlinks for project dotfiles..."
symlinkifne .crontab
#symlinkifne .gemrc
#symlinkifne .gitconfig
#symlinkifne .gitignore
#symlinkifne .profile
#symlinkifne .rvmrc
#symlinkifne .screenrc
#symlinkifne .vim
#symlinkifne .vimrc
#symlinkifne .zlogout
#symlinkifne .zprofile
#symlinkifne .zshenv
#symlinkifne .zshrc

popd > /dev/null 2>&1



bot "Woho! All done."
