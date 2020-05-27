#!/usr/bin/env bash

# Path
# set PATH so it includes user's private bin directory
test -d "$HOME"/bin || mkdir -p "$HOME"/bin
export PATH="$HOME"/bin:"$PATH"

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

# Readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
