CURRENT_DIR=$(dirname ${BASH_SOURCE[0]})

# load system configuration
if [ "$(uname)" = "Darwin" ]; then
	. $CURRENT_DIR/osx/.bash_profile
elif [ "$(uname)" = "Linux" ]; then
	. $CURRENT_DIR/linux/.bash_profile
fi

# load private stuff
for f in $CURRENT_DIR/work/.{aliases,exports,functions,paths}; do
    [ -r "$f" ] && source "$f"
done
unset f

unset CURRENT_DIR
