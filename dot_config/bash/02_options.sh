#!/usr/bin/env bash

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# If running under a GUI terminal emulator $DISPLAY is set
if [ -n "$DISPLAY" ]; then
  # Checks the window size after each command and, if necessary,
  # updates the values of LINES and COLUMNS
  shopt -s checkwinsize

  # Set TERM variables
  TERM='xterm-256color'
  # shellcheck disable=SC2034
  COLORTERM='truecolor'
fi

# Bash completion

# shellcheck disable=SC2154
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
