#!/bin/bash
# ~/.bash/functions.bash

# Extract command (from ArchWiki)
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# History special function
h () {
    if [[ "$1" =~ ^[0-9]*$ ]] ; then
        history $1
    elif [ -n "$2" ] && [[ "$2" =~ ^[0-9]*$ ]] ; then
        history | grep $1 | tail -n $2
    else
        history | grep $1 
    fi
}
