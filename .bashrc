#
# ~/.bashrc
#


# If not running interactively, do not do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alis grep='grep --color=auto'

PS1='\[\e[38;5;40m\]\[\e[0m\]  \[\e[38;5;248;1m\]\w\[\e[0m\] '
