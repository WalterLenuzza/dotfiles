#!/usr/bin/env zsh

# ~/.zshenv: executed by zsh(1)
# Used for setting user's environment variables; it should not contain commands that produce output or assume the shell is attached to a tty. This file will always be sourced.

# Source only if interactive
[[ "$-" == *i* ]] && { \
  [ -d "$HOME"/.config/zsh ] && ZDOTDIR="$HOME"/.config/zsh
}

