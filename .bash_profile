#!/usr/bin/env bash

# ~/.bash_profile: executed by bash(1) for login shells (spawned by a TTY or by a SSH daemon)

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

# Execute Message of the Day script
if [ "$(command -v motd)" ]; then
  motd
fi
