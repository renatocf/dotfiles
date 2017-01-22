# ~/.bash_aliases

# Enable color support for commands
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add useful ls aliases
alias ll='ls -hAlF'
alias la='ls -A'
alias l='ls -CF'

# Get rid of a boring test...
alias sl='ls'

# Jobs management
alias jobs='jobs -l'

# Vi/Vim/Neovim aliases
if which nvim &> /dev/null; then
    alias vim='nvim'
fi
alias vi='vim'

# Enable default options of mkdir
alias mkdir='mkdir -pv'

# Make commands more human-readable
alias mount='mount | column -t'
alias df='df -H'
alias du='du -ch'

# Prompt when removing more than 3 files
alias rm='rm -i --preserve-root'

# Increase safety when managing files
alias mv='mv -vi'
alias cp='cp -vi'
alias ln='ln -vi'

# Show opened ports
alias ports='netstat -tulanp'

# Add an "alert" alias for long running commands. Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Make less display colors
export LESS="-R"
