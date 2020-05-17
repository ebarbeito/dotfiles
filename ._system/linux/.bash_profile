# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#PATH=/opt/eclipse:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:$PATH

alias ls='ls --color=auto'

# apt aliases
if [ $UID -ne 0 ]; then
	alias apt-get='sudo apt-get'
	alias aptitude='sudo aptitude'
fi
