#!/usr/bin/env zsh

# $ZDOTDIR/.zshrc: executed by zsh(1) for non-login shells

# If not running interactively, or for login shells, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ -r "$HOME"/.config/shell/rc ] && source "$HOME"/.config/shell/rc

# Set TERM
TERM='xterm-color'

HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=4096
SAVEHIST=4096

setopt appendhistory autocd
unsetopt extendedglob

bindkey -e

autoload -Uz compinit
compinit -d "$HOME"/.cache/zsh/zcompdump

# For non-login shells
case $- in
    *l*) return;;
      *) [ -r "$HOME"/.config/shell/prompt ] && source "$HOME"/.config/shell/prompt
	 if [ "$(command -v motd)" ]; then
           motd
         fi
         ;;
esac
