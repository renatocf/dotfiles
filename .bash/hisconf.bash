#!/bin/bash 
# ~/.bash/hisconf.bash

# save history file, if existis, in .bash/ directory. 
# In other cases, save it in .bash_history
if [ -d ~/.bash ]; then
    export HISTFILE=~/.bash/history.bash
else
    export HISTFILE=~/.bash_history
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# words ingnored when saving history
export HISTIGNORE="clear*":"cd ~":"cd ..":"cd -":make:fg:history:h\ *:ls:la:ll:l
