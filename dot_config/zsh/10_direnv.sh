#!/usr/bin/env bash

# Load direnv (if installed)
if [ "$(command -v direnv)" ]; then
  eval "$(direnv hook zsh)"
fi
