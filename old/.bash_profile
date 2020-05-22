#!/usr/bin/env bash

# ~/.bash_profile: executed by bash(1) for login shells, spawned by a TTY or by a SSH daemon

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -r "$HOME"/.config/shell/rc ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.config/shell/rc
fi

if [ -r "$HOME"/.config/shell/profile ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.config/shell/profile
fi

if [ -r "$HOME"/.config/bash/rc ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.config/bash/rc
fi

if [ -r "$HOME"/.config/bash/profile ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.config/bash/profile
fi
