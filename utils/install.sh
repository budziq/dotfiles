#
# my VIMRC and plugins installer
#
# created by Eddie Kao <eddie@digik.com.tw>
# just for installing my .vim configurations and plugins in one command.
#
# shamesly modified by budziq to suit his needs 
#

# assign valie if none is given on command line
dotfiles_folder=${1:-"${HOME}/dotfiles"}
vim_folder="${HOME}/.vim"
vim_rc="${HOME}/.vimrc"
bash_rc="${HOME}/.bashrc"
backup_rand=$RANDOM

# detect if there's a .vim folder
if [ -d $vim_folder ]
then
  echo "\033[0;31mYou already have a .vim folder in your home directory.\033[0;m"
  read -p "Would you like to backup your .vim folder first? [y/n] " ans
  if [ "$ans" == "y" ]
  then
    echo "backup your original $vim_folder to $vim_folder-$(date +%Y%m%d)-$backup_rand"
    mv $vim_folder $vim_folder-$(date +%Y%m%d)-$backup_rand
  else
    exit
  fi
fi

echo $vim_rc

# check if vimrc is already exist
if [ -L $vim_rc ] || [ -f $vim_rc ]
then
  echo "\033[0;31mThere's .vimrc in your home directory.\033[0;m"
  read -p "Would you like to backup your .vimrc first? [y/n] " ans
  if [ "$ans" == "y" ]
  then
    echo "backup your original $vim_rc to $vim_rc-$(date +%Y%m%d)-$backup_rand"
    mv $vim_rc $vim_rc$(date +%Y%m%d)-$backup_rand
  else
    exit
  fi
fi

echo $bash_rc

# check if .bashrc is already exist
if [ -L $bash_rc ] || [ -f $bash_rc ]
then
  echo "\033[0;31mThere's .bashrc in your home directory.\033[0;m"
  read -p "Would you like to backup your .bashrc first? [y/n] " ans
  if [ "$ans" == "y" ]
  then
    echo "backup your original $bash_rc to $bash_rc-$(date +%Y%m%d)-$backup_rand"
    mv $bash_rc $bash_rc$(date +%Y%m%d)-$backup_rand
  else
    exit
  fi
fi

# TODO add linking of git related stuff (global_gitignore gitconfig)
# TODO add linking of tmux and zsh stuff (tmux.conf, zshrc, bash_profile)
# TODO remove non-functional color codes
# TODO make selector for work and private gitconfig

# make symbolic links
ln -s $dotfiles_folder/vimrc $vim_rc
ln -s $dotfiles_folder/bashrc $bash_rc
ln -s $dotfiles_folder/vim $vim_folder

# [TODO] write script to run updates 
#cd $vim_folder
#sh ./update.sh

echo ""
echo "\033[0;34mNice! Seems everything is done.\033[0m"
echo "\033[0;34mGithub Repository: https://github.com/budziq/dotfiles\033[0m"
echo ""

exit
