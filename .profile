# BASH shell
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    # shellcheck source=./.bashrc
    . "$HOME/.bashrc"
  fi
fi
