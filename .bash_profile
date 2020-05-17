# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# load definitions
for f in ~/.{aliases,exports,functions,paths}; do
    [ -r "$f" ] && source "$f"
done
unset f

# extended profile by system
DOTFILES=$HOME/.dotfiles
if [ -r $DOTFILES/._system/.profile ]; then
	. $DOTFILES/._system/.profile
fi
unset DOTFILES
