#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.

# If interactive, source ~/.config/shell/rc and ~/.config/bash/rc
[[ "$-" == *i* ]] && {\
  [ -r ~/.config/shell/rc ] && source ~/.config/shell/rc
  [ -r ~/.config/bash/rc ] && source ~/.config/bash/rc
  [ -r ~/.config/shell/scratchpad ] && source ~/.config/shell/scratchpad
  [ -r ~/.config/shell/motd ] && source ~/.config/shell/motd
}
