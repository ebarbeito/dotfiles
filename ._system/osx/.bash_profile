# bash completion in mac
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[ -r "/usr/local/etc/profile.d/bash_completion.sh" ] && . "/usr/local/etc/profile.d/bash_completion.sh"

# brew
if type brew &>/dev/null; then
    export HOMEBREW_BUNDLE_FILE="$(dirname ${BASH_SOURCE[0]})/.brewfile"
    export HOMEBREW_NO_ANALYTICS=true
fi

# java
if type /usr/libexec/java_home &>/dev/null; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# extended path defined by /usr/libexec/path_helper -s
# see /etc/paths, /etc/paths.d
PATH=/opt/android-sdk-macosx/tools\
:/opt/android-sdk-macosx/platform-tools\
:/usr/local/opt/mysql-client/bin\
:$PATH; export PATH

# Command-line tools replacements
if type brew &>/dev/null; then
    HOMEBREW_PREFIX=$(brew --prefix)
    # gnubin; gnuman
    for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
    for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
fi

# alias definitions
if ls --color -d . >/dev/null 2>&1; then
    alias ls='ls --color=auto'
elif ls -G -d . >/dev/null 2>&1; then
    alias ls='ls -G'
fi
alias brewup='brew update && brew upgrade && brew cask upgrade && brew cleanup && brew doctor'
alias cask='brew cask'
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias myip_lan='ipconfig getifaddr en0'
alias ping='/sbin/ping'
alias rmdss='find . -type f -name .DS_Store | xargs rm -rf'
