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

# XDG Base directories
# https://wiki.archlinux.org/index.php/XDG_Base_Directory

if [ -z "$XDG_CACHE_HOME" ]; then
  export XDG_CACHE_HOME="$HOME"/.cache
fi

if [ -z "$XDG_CONFIG_HOME" ]; then
  export XDG_CONFIG_HOME="$HOME"/.config
fi

if [ -z "$XDG_DATA_HOME" ]; then
  export XDG_DATA_HOME="$HOME"/.local/share
fi

# If running under a GUI terminal emulator $DISPLAY is set
if [ -n "$DISPLAY" ]; then
  # Set TERM variables
  TERM='xterm-256color'
  # shellcheck disable=SC2034
  COLORTERM='truecolor'
fi

