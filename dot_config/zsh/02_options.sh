#!/usr/bin/env bash

# ZSH completion

# enable autocomplete
autoload -Uz compinit
test -d "$XDG_CACHE_HOME"/zsh || mkdir -p "$XDG_CACHE_HOME"/zsh
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump

setopt autocd nomatch notify
unsetopt beep extendedglob
setopt appendhistory autocd

# arrow-key driven interface
zstyle ':completion:*' menu select

# fuzzy-match
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# ignore on missing
zstyle ':completion:*:functions' ignored-patterns '_*'

# autocompletion of privileged environments in privileged commands
zstyle ':completion::complete:*' gain-privileges 1

# autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# prompt
autoload -Uz promptinit
promptinit

# default prompt
prompt fire
