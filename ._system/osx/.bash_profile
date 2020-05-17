# bash completion in mac
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# brew bundle
if type brew &>/dev/null; then
    export HOMEBREW_BUNDLE_FILE="$(dirname ${BASH_SOURCE[0]})/.brewfile"
fi

# java
if type /usr/libexec/java_home &>/dev/null; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# extended path defined by /usr/libexec/path_helper -s
# see /etc/paths, /etc/paths.d
PATH=/opt/android-sdk-macosx/tools\
:/opt/android-sdk-macosx/platform-tools\
:$PATH; export PATH

# Command-line tools replacements
if type brew &>/dev/null; then
    HOMEBREW_PREFIX=$(brew --prefix)
    # gnubin; gnuman
    for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
    for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
fi

# alias definitions
alias brewup='brew update && brew upgrade && brew cask upgrade && brew cleanup && brew doctor'
alias rmdss='find . -type f -name .DS_Store | xargs rm -rf'
