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

# export definitions
if [ -f ~/.exports ]; then
    . ~/.exports
fi

# alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# function definitions
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# system's extended profile
DOTFILES=$HOME/.dotfiles
if [ "$(uname)" = "Darwin" ]; then
	. $DOTFILES/._system/osx/.bash_profile
elif [ "$(uname)" = "Linux" ]; then
	. $DOTFILES/._system/linux/.bash_profile
fi
unset DOTFILES

# work specific
#if [ -f ~/.bash_work ]; then
#    . ~/.bash_work
#fi
