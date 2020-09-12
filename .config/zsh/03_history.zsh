#!/usr/bin/env zsh

# ZSH history settings

# Append
setopt appendhistory

# file
# shellcheck disable=SC2154
test -d "$XDG_DATA_HOME"/zsh || mkdir -p "$XDG_DATA_HOME"/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# Size
export HISTSIZE=32768
export SAVEHIST=$HISTSIZE

# Avoid duplicates
setopt hist_ignore_all_dups

# Prevent particular entries from being recorded into a history by preceding them with at least one spaces
setopt hist_ignore_space

## Iignore
#HISTIGNORE='&:ls:cd ~:cd ..:pwd:clear:[bf]g:exit:h:history'

# Set imestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
#HISTTIMEFORMAT='%F %T '

