if [ -n "$BASH_VERSION" ]; then
    CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")
elif [ -n "$ZSH_VERSION" ]; then
    CURRENT_DIR=$(dirname "${(%):-%x}")
else
    CURRENT_DIR=$(dirname "$0")
fi

# load system configuration
if [ "$(uname)" = "Darwin" ]; then
	# shellcheck source=./osx/.bash_profile
	. "$CURRENT_DIR"/osx/.bash_profile
elif [ "$(uname)" = "Linux" ]; then
	# shellcheck source=./linux/.bash_profile
	. "$CURRENT_DIR"/linux/.bash_profile
fi

# load custom stuff
for f in $CURRENT_DIR/custom/.{aliases,exports,functions,paths}; do
    [ -r "$f" ] && . "$f"
done
unset f

unset CURRENT_DIR
