#!/usr/bin/env bash

###
# some bash library helpers
# @author Adam Eivy
###

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"
CNTVAR=0

function ok() {
    echo -e "$COL_GREEN[ok]$COL_RESET "$1
}

function bot() {
    echo -e "$COL_GREEN\[._.]/$COL_RESET - [$CNTVAR] $1"
    CNTVAR=$((CNTVAR+1))
}

function running() {
    echo -en "$COL_YELLOW => $COL_RESET"$1": "
}

function action() {
    echo -en "$COL_BLUE [action]\n    >> $COL_RESET $1..."
}

function warn() {
    echo -e "$COL_YELLOW\[-_-]/ - [warning]$COL_RESET "$1
}

function error() {
    echo -e "$COL_RED\[>_<]/ - [error]$COL_RESET "$1
    exit -1
}


function require_apt() {
    running "apt $1"
    if [[ $(dpkg -l | grep '^ii' | cut -d' ' -f3 | grep -x $1) != $1 ]];
        then
            action "apt-get install $1"
            sudo apt-get install -y $1 2>&1 > /dev/null
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
        fi
    fi
    ok
}

function run() {
    running "do"; printf '%s ' ${@}
    "$@" > /dev/null 2>&1
    if [[ $? != 0 ]]; then
        error "failed to run $@! aborting..."
    fi
    ok
}

function srun() {
    running "$COL_MAGENTA""sudo""$COL_RESET"; printf '%s ' ${@}
    sudo "$@" > /dev/null 2>&1
    if [[ $? != 0 ]]; then
        error "failed to run $@! aborting..."
    fi
    ok
}
function require_gem() {
    running "gem $1"
    if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]];
        then
            action "gem install $1"
            gem install $1
    fi
    ok
}

function symlinkifne {
    running "$1"
    if [[ -e $1 ]]; then
        # file exists
        if [[ -L $1 ]]; then
        # it's already a simlink (could have come from this project)
            echo -en '\tsimlink exists, skipped\t';ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e ~/.dotfiles_backup/$1 ]];then
            mv $1 ~/.dotfiles_backup/
            echo -en 'backed up saved...';
        fi
    fi
    # create the link
    ln -s ~/.dotfiles/$1 $1
    if [[ $? != 0 ]]; then
        error "failed to install $1! aborting..."
    fi
        echo -en 'linked';ok
}

