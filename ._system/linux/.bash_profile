# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long-running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias apt='sudo apt'
alias dmesg='sudo dmesg --human'
alias sysupgrade='
echo "Updating package lists..."
sudo apt update &&
echo && echo "Upgrading installed packages..."
sudo apt upgrade -y &&
echo && echo "Removing unnecessary packages..."
sudo apt autoremove -y &&
echo && echo "Cleaning apt cache..."
sudo apt clean &&
echo "Cleaning snap cache..."
sudo rm -rf /var/cache/snapd/* &&
echo "Cleaning system caches..."
sudo apt-get clean &&
sudo apt-get autoclean &&
sudo apt-get autoremove --purge &&
sudo rm -rf /var/cache/apt/* &&
if [ -f /var/run/reboot-required ] || [ -f /run/reboot-required ]; then
    echo && echo "Upgrades require reboot"
fi
'

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Language settings
export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
