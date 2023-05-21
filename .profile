#!/bin/bash
mkdir ~/.cache
mkdir -p ~/.config/nano
mkdir -p ~/.local/{bin,lib,share,state}
mkdir {documents,downloads,images,projects}
cat << 'EOF' > ~/.bashrc
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
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
PS1='\[\e[0;38;5;220m\][\[\e[0;1;96m\]\u\[\e[0;1;38;5;220m\]@\[\e[0;95m\]\H\[\e[0;38;5;220m\]]\[\e[0;38;5;220m\]:\[\e[0;38;5;220m\]{\[\e[0;1;96m\]\w\[\e[0;38;5;220m\]}\[\e[0;38;5;220m\]- \[\e[0;1;38;5;220m\]\$ \[\e[0m\]'
# Load custom aliases, functions, exports and completions
if [ -f ~/.config/.bash_aliases ]; then
    . ~/.config/.bash_aliases
fi
if [ -f ~/.config/.bash_functions ]; then
    . ~/.config/.bash_functions
fi
if [ -f ~/.config/.bash_exports ]; then
    . ~/.config/.bash_exports
fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
EOF
cat << 'EOF' > ~/.config/.bash_exports
#!/bin/bash
set -a
XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/.config"
XDG_STATE_HOME="$HOME/.local/state"
XDG_CACHE_HOME="$HOME/.cache"
XDG_RUNTIME_DIR="$HOME/.local/bin/run"
set +a
EOF
cat << 'EOF' > ~/.config/.bash_aliases
#!/bin/bash
# alias l='ls --color=auto -lAhF'
alias grep='grep --color=auto'
alias l='exa -TFa --level=2 --color=always --header --inode'
alias dpsa='docker ps -a'
alias cs='clear'
alias sb='source ~/.bashrc'
alias cb='nano ~/.bashrc'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
EOF
cat << 'EOF' > ~/.config/.bash_functions
#!/bin/bash
# set variables
declare -r TRUE=0
declare -r FALSE=1
declare -r PASSWD_FILE=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
##################################################################
# Purpose: Converts a string to lower case
# Arguments:
#   $1 -> String to convert to lower case
##################################################################
function to_lower() {
    local str="$@"
    local output
    output=$(tr '[A-Z]' '[a-z]'<<<"${str}")
    echo $output
}
##################################################################
# Purpose: Display an error message and die
# Arguments:
#   $1 -> Message
#   $2 -> Exit status (optional)
##################################################################
function die() {
    local m="$1"        # message
    local e=${2-1}      # default exit status 1
    echo "${RED}$m${STD}"
    exit $e
}
##################################################################
# Purpose: Return true if script is executed by the root user
# Arguments: none
# Return: True or False
##################################################################
function is_root() {
   [ "$(id -u)" -eq 0 ] && return $TRUE || return $FALSE
}
##################################################################
# Purpose: Return true if $user exists in /etc/passwd
# Arguments: $1 (username) -> Username to check in /etc/passwd
# Return: True or False
##################################################################
function user_exists() {
    local u="$1"
    grep -q "^${u}" $PASSWD_FILE && return $TRUE || return $FALSE
}
##################################################################
# Purpose: Grep the process list for a given process or pattern
# Arguments: $1 (regex) -> Process to check for in ps aux output
# Return: Line(s) containing the given process
##################################################################
function fproc() {
    ps aux | grep -v grep | grep -i -e VSZ -e $1
}
EOF
cat << 'EOF' > ~/.config/.bash_logout
# Added for default deployments 05.16.2023 -ts
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
rm ~/.profile
EOF
