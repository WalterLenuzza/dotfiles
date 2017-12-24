#!/usr/bin/env bash

# ~/.bash_profile: executed by bash(1) for non-login shells

# Source only if interactive
[[ "$-" == *i* ]] && { \
  [ -r ~/.config/shell/rc ] && source ~/.config/shell/rc
  [ -r ~/.config/bash/rc ] && source ~/.config/bash/rc
  [ -r ~/.config/shell/scratchpad ] && source ~/.config/shell/scratchpad
  [ -r ~/.config/shell/motd ] && source ~/.config/shell/motd
}
