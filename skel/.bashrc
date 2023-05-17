# Added for default deployments 05.16.2023 -ts

# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Basic options
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Prompt, term, and color settings
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Load custom aliases, functions, exports and completions
if [ -f ~/.config/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.config/.bash_functions ]; then
    . ~/.bash_functions
fi
if [ -f ~/.config/.bash_exports ]; then
    . ~/.bash_exports
fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

custom_prompt(){
    PS1='\[\e[0;38;5;220m\][\[\e[0;1;96m\]\u\[\e[0;1;38;5;220m\]@\[\e[0;95m\]\H\[\e[0;38;5;220m\]]\[\e[0;38;5;220m\]:\[\e[0;38;5;220m\]{\[\e[0;1;96m\]\w\[\e[0;38;5;220m\]}\[\e[0;38;5;220m\]- \[\e[0;1;38;5;220m\]\$ \[\e[0m\]'
}
custom_prompt
