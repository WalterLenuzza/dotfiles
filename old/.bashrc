#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -r "$HOME"/.config/shell/rc ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.config/shell/rc
fi

if [ -r "$HOME"/.config/bash/rc ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.config/bash/rc
fi

if [ -r "$HOME"/.config/shell/prompt ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.config/shell/prompt
fi

if [ "$(command -v motd)" ]; then
  motd
fi
