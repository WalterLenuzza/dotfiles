#!/usr/bin/env zsh

# ~/.zshenv: executed by zsh(1)
# Used for setting user's environment variables
# it should not contain commands that produce output or assume the shell is attached to a tty.
# This file will always be sourced.

# XDG base directories
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-'~/.cache'}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-'~/.config'}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-'~/.local/share'}"

# Set config directory
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

