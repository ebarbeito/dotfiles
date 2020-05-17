# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# extended PATH
if [ -d "$HOME/.bin" ]; then
   PATH="$HOME/.bin:$PATH"
fi

# alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# export definitions
if [ -f ~/.exports ]; then
    . ~/.exports
fi

# function definitions
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# extended profile by system
DOTFILES=$HOME/.dotfiles
if [ -f $DOTFILES/._system/.profile ]; then
	. $DOTFILES/._system/.profile
fi
unset DOTFILES
