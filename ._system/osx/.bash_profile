# Load SSH keys stored in macOS Keychain
if ssh-add -l 2>/dev/null | grep -q 'no identities'; then
    ssh-add --apple-load-keychain &>/dev/null
fi

# brew
[ -d "/opt/homebrew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
    HOMEBREW_BUNDLE_FILE="$(dirname "${BASH_SOURCE[0]}")/.brewfile"
    export HOMEBREW_BUNDLE_FILE
    export HOMEBREW_CASK_OPTS="--no-quarantine"
    export HOMEBREW_FORCE_BREWED_CURL=1
    export HOMEBREW_NO_ANALYTICS=true
    export HOMEBREW_NO_AUTO_UPDATE=true
fi

# bash completion in mac
export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"
[[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] && . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"

# java
if type /usr/libexec/java_home &>/dev/null; then
    JAVA_HOME=$(/usr/libexec/java_home)
    export JAVA_HOME
    export PATH=$JAVA_HOME/bin:$PATH
fi

# go
if type go &>/dev/null; then
    GOROOT="$(brew --prefix golang)/libexec"
    export GOROOT
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
fi

# fzf bash integration
eval "$(fzf --bash)"

# extended path defined by /usr/libexec/path_helper -s
# see /etc/paths, /etc/paths.d
PATH=/opt/android-sdk-macosx/tools\
:/opt/android-sdk-macosx/platform-tools\
:$HOMEBREW_PREFIX/opt/mysql-client/bin\
:/Applications/PhpStorm.app/Contents/MacOS\
:$PATH; export PATH

# Command-line tools replacements
if type brew &>/dev/null; then
    for d in "${HOMEBREW_PREFIX}"/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
    for d in "${HOMEBREW_PREFIX}"/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
fi
PATH=$HOMEBREW_PREFIX/opt/curl/bin\
:$HOMEBREW_PREFIX/opt/gnu-getopt/bin\
:$PATH; export PATH
MANPATH=$HOMEBREW_PREFIX/opt/curl/share/man\
:$HOMEBREW_PREFIX/opt/gnu-getopt/share/man\
:$MANPATH; export MANPATH

# alias definitions
alias bandwhich='sudo bandwhich'
if ls --color -d . >/dev/null 2>&1; then
    alias ls='ls --color=auto'
elif ls -G -d . >/dev/null 2>&1; then
    alias ls='ls -G'
fi
alias sysupgrade='
brew update &&
brew upgrade &&
brew cu --all --yes --cleanup &&
brew bundle install &&
brew bundle cleanup -f &&
brew cleanup -s &&
rm -rf "$(brew --cache)" &&
npm outdated -g --depth=0 &&
npm update -g --no-fund &&
npm install -g npm &&
brew doctor
'
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias htop='sudo htop'
alias myip_lan='ipconfig getifaddr en0'
alias o.='open .'
alias ping='/sbin/ping'
alias rmdss='find . -type f -name .DS_Store -exec rm -f {} \;'
alias nameservers="scutil --dns | grep 'nameserver\[[0-9]*\]' | sort | uniq | trim"

