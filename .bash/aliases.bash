#!/bin/bash
# ~/.bash/aliases.bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias sl='ls' # I'm tired of this error message...
alias ll='ls -hAlF'
alias la='ls -A'
alias l='ls -CF'

# jobs management
alias jobs='jobs -l'
alias vi='vim'

# Opening stuff by ssh
# alias gedit='gedit &> /dev/null &'
# alias gvim='gvim &> /dev/null &'

# mkdir creates parent directories
alias mkdir='mkdir -pv'

# more human-readability
alias mount='mount | column -t'
alias df='df -H'
alias du='du -ch'

# Complete log to git
alias githistory='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'

# prompts when removing more than 3 files
alias rm='rm -i --preserve-root'

# increase safety when managing files
alias mv='mv -vi'
alias cp='cp -vi'
alias ln='ln -vi'

# start X with no error messages
alias startx='startx 2> /dev/null'

# show opened ports
alias ports='netstat -tulanp'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# less displaying colors
export LESS="-R"
