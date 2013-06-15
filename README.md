My dotfiles
-----------

To try it out (READONLY) just clone the repo

    git clone --recursive https://github.com/budziq/dotfiles.git ~/dotfiles 

and install symbolic links to your *dotfiles* folder. 

    ~/dotfiles/utils/install.sh ~/dotfiles  

For read-write access, fork this repo and do something like:
        
    git clone --recursive git@github.com:budziq/dotfiles.git ~/dotfiles && ~/dotfiles/utils/install.sh ~/dotfiles
