#!/usr/bin/env sh

# Shared shell settings (bash/zsh)
# Environment variables
# shellcheck disable=SC2154

# If running under a GUI terminal emulator $DISPLAY is set
if [ -n "$DISPLAY" ]; then
  # Set TERM variables
  export TERM='xterm-256color'
  export COLORTERM='truecolor'
fi

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Colorize ls
export CLICOLOR=1
export CLICOLOR_FORCE=1 # Always show colors (with less and grep), Experimental

# # Enable color support of ls and also add handy aliases
# if [ "$(command -v dircolors)" ]; then
#   eval $(dircolors -b "$XDG_CONFIG_HOME"/dircolors)
# fi

# Proxy

# export http_proxy="http://192.168.1.1:8080"
# export https_proxy="https://192.168.1.1:8080"
# export ftp_proxy="ftp://192.168.1.1:8080"
# export rsync_proxy="http://192.168.1.1:8080"
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

# XDG user directories
# https://wiki.archlinux.org/index.php/XDG_user_directories

export XDG_BIN_DIR="$HOME/bin"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_SOURCE_DIR="$HOME/src"
export XDG_TEMP_DIR="$HOME/tmp"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"

## Fixes for packages without builtin XDG support

# less
test -d "$XDG_CACHE_HOME"/less || mkdir -p "$XDG_CACHE_HOME"/less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# GnuPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GPG_TTY=$(tty)

# SSH agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# AWS CLI
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

# Xorg GTK
#export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
#export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd

# Vagrant
#export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
#export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
