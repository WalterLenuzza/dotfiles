#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells (spawned by a GUI terminal)

# If not running interactively, don't do anything else
case $- in
  *i*) ;;
    *) return;;
esac

# XDG base directories
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-'~/.cache'}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-'~/.config'}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-'~/.local/share'}"

# Source BASH numbered config files
for file in "$XDG_CONFIG_HOME"/bash/[0-9][0-9]_*.sh; do
  [ -r "$file" ] && . "$file"
done

# Source shared numbered config files
for file in "$XDG_CONFIG_HOME"/shell/[0-9][0-9]_*.sh; do
  [ -r "$file" ] && . "$file"
done

# If running under a GUI terminal emulator $DISPLAY is set
if [ -n "$DISPLAY" ]; then
  # Source enhanced prompt for GUI terminal emulators
  if [ -r "$XDG_CONFIG_HOME"/bash/prompt ]; then
    . "$XDG_CONFIG_HOME"/bash/prompt
  fi
fi
