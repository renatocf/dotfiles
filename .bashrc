# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Alias definitions.
# You may want to put all your aliases into a separate file like
# ~/.bash_aliases or ~/.bash/aliases.bash, instead of adding them 
# here directly. See /usr/share/doc/bash-doc/examples in the bash-doc 
# package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
elif [ -f ~/.bash/aliases.bash ]; then
    . ~/.bash/aliases.bash
fi

# Profile
# You may want to put all your paths into a separate file like
# ~/.profile or ~/.bash/profile.bash, instead of adding them here 
# directly.
if [ -f ~/.bash/profile.bash ]; then
    . ~/.bash/profile.bash
fi

# History
# You may want to put all your history configurations into a separate
# file like ~/.bash_hisconf or ~/.bash/hisconf.bash, instead of adding 
# them here directly.
if [ -f ~/.bash_hisconf ]; then
    . ~/.bash_hisconf
elif [ -f ~/.bash/hisconf.bash ]; then
    . ~/.bash/hisconf.bash
fi

# Functions
# You may want to put all your functions into a separate file 
# like ~/.bash_functions or ~/.bash/functions.bash, instead of 
# adding them here directly.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
elif [ -f ~/.bash/functions.bash ]; then
    . ~/.bash/functions.bash
fi

# Logout
# You may want to put your logout configurations into a separate file 
# like ~/.bash_logout or ~/.bash/logout.bash, instead of 
# adding them here directly.
if [ -f ~/.bash_logout ]; then
    . ~/.bash_logout
elif [ -f ~/.bash/logout.bash ]; then
    . ~/.bash/logout.bash
fi

export EDITOR=vim
export VISUAL=vim
