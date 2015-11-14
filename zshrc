# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/utils/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kolo"
#ZSH_THEME="blinks"
#ZSH_THEME="agnoster"
ZSH_THEME="dpoggi"
#ZSH_THEME="murilasso"
setopt rmstarsilent
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python tmux)

source $ZSH/oh-my-zsh.sh

#force tmux to recognize 256 color terminal
alias tmux="tmux -2"
export DOTFILES=$HOME/dotfiles


precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}

# work in a tmux session if tmux is installed
if [ "$TMUX" = "" ]; then
  if which tmux 2>&1 >/dev/null; then
    tmux attach -t hack || tmux new -s hack; exit
  fi
fi

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# 't' the todo manager
alias t='python ~/bin/t/t.py --task-dir ~/tasks --list tasks'
alias tt='t -- :w:'
alias d="t '/^:.:/:d:/' -e"
alias b="t '/^:.:/:b:/' -e"
alias w="t '/^:.:/:w:/' -e"
alias n="t '/^:.:/:n:/' -e"

# log colorizer perl oneliners
alias w_color="perl -pe 's/warn.*/\e[0m\e[1;45m$&\e[0m/i'"
alias e_color="perl -pe 's/error.*/\e[0m\e[1;41m$&\e[0m/i'"
alias f_color="perl -pe 's/fail.*/\e[0m\e[1;31m$&\e[0m/i'"
alias err='w_color | e_color | f_color'

# import local settings if they exist
if [[ -e ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
