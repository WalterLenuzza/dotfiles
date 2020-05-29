#!/usr/bin/env bash

# ZSH history settings

# Append
setopt appendhistory

# file
# shellcheck disable=SC2154
test -d "$XDG_DATA_HOME"/zsh || mkdir -p "$XDG_DATA_HOME"/zsh
HISTFILE="$XDG_DATA_HOME"/zsh/history

# Size
HISTSIZE=32768
SAVEHIST=32768

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups

# Iignore
HISTIGNORE='&:ls:cd ~:cd ..:pwd:clear:[bf]g:exit:h:history'

# Set imestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
HISTTIMEFORMAT='%F %T '

