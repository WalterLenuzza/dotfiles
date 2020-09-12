#!/usr/bin/env zsh

# ZDOTDIR/.zshrc: executed by zsh(1)
# Used for setting user's interactive shell configuration and executing commands,
# will be read when starting as an interactive shell (spawned by a GUI terminal)

# Source BASH numbered config files
for file in "$XDG_CONFIG_HOME"/zsh/[0-9][0-9]_*.zsh; do
  [ -r "$file" ] && . "$file"
done

# Source shared numbered config files
for file in "$XDG_CONFIG_HOME"/shell/[0-9][0-9]_*.sh; do
  [ -r "$file" ] && . "$file"
done

# If running under a GUI terminal emulator $DISPLAY | $WAYLAND_DISPLAY is set
if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
  # Source enhanced prompt for GUI terminal emulators
  if [ -r "$XDG_CONFIG_HOME"/zsh/guiprompt.zsh ]; then
    . "$XDG_CONFIG_HOME"/zsh/guiprompt.zsh
  fi
fi

