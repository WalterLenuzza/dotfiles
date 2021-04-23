#!/usr/bin/env zsh

# Shell
if [ -z "$SHELL" ]; then
  export SHELL="$(command -v zsh)"
fi

# Path
# set PATH so it includes user's private bin directory
test -d "$HOME"/bin || mkdir -p "$HOME"/bin
typeset -U PATH path
path=("$HOME/bin" "$path[@]")
export PATH

# Add Kubectl Krew
test -d "$HOME/.krew/bin" && export PATH="$PATH:$HOME/.krew/bin"

# If running under a GUI terminal emulator $DISPLAY | $WAYLAND_DISPLAY is set
if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
  # Set TERM variables
  TERM='xterm-256color'
  # shellcheck disable=SC2034
  COLORTERM='truecolor'
fi

