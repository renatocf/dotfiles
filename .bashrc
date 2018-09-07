# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability;
# turned off by default to not distract the user: the focus in a
# terminal window should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="${debian_chroot:+($debian_chroot)}[\\[\033[01;32m\]u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]]\\$ "    
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="${debian_chroot:+($debian_chroot)}[\u@\h \W]\\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# Completion
# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Aliases
# You may want to put all your aliases into a separate
# like ~/.bash_aliases adding them here directly.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Helper functions
# You may want to put all your helper functions into a separate
# file like ~/.bash_helpers adding them here directly.
if [ -f ~/.bash_helpers ]; then
  . ~/.bash_helpers
fi

# History
export HISTSIZE=5000
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="clear":"cd ~":"cd ..":"cd -":"fg":"ls":"la":"ll":"l"

# Editors
export EDITOR=vim
export VISUAL=vim

# RBEnv
export PATH="~/.rbenv/shims:$PATH"

# Yarn
export PATH="~/.yarn/bin:$PATH"

# NVM
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null
