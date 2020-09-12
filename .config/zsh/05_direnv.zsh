#!/usr/bin/env zsh

# Load direnv (if installed)
if [ "$(command -v direnv)" ]; then
  eval "$(direnv hook zsh)"
fi
