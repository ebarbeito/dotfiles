DOTFILES=$HOME/.dotfiles

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable `**` pattern in filename expansion to match all files
shopt -s globstar

# history: append to $HISTFILE, don't overwrite it
shopt -s histappend

# load shell definitions
for f in $DOTFILES/.shell.d/.{aliases,exports,functions,paths,prompt}; do
    [ -r "$f" ] && source "$f"
done; unset f

# extended profile by system
if [ -r "$DOTFILES"/._system/.profile ]; then
	. "$DOTFILES"/._system/.profile
fi

unset DOTFILES

