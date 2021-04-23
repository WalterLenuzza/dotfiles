#!/usr/bin/env bash

# Shared shell settings (bash/zsh)
# Functions

# Check if commands exist
commands_exist() {
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null 2>&1 || return 1
  done
}

# Speed up script by not using unicode
disable_unicode() {
  export LC_ALL=C
  export LANG=C
}

# Log the message to standard error, as well as the system log
# Ref. `man logger` and `man syslog`
# $1: message to log
# $2: priority (optional, defaults to user.notice)
# $3: tag (optional)
log() {
  local message="$1"
  local priority="$([ -z "$2" ] || echo -n "-p user.$2")"
  local tag="$([ -z "$3" ] || echo -n "-t $3")"
  logger -s "$priority $tag $message"
}

# Colorize 'man'
man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Message of the Day
motd() {
#  # Print pretty system logo/info (neofetch)
#  if [ "$(command -v neofetch)" ]; then
#    neofetch
#  fi

  # Fortune
  if [ "$(command -v fortune)" ]; then
    fortune computers science
  fi

  # Show today's anniversaries
  if [ "$(command -v calendar)" ]; then
    calendar -A 0 -f /usr/share/calendar/calendar.world
  fi
}

# Colorized $PATH
path() {
  local blue="\\033[1;34m"
  local green="\\033[0;32m"
  local cyan="\\033[0;36m"
  local purple="\\033[0;35m"
  local brown="\\033[0;33m"
  local reset_color="\\033[0m"
  echo "$PATH" | tr ":" "\\n" |
    awk "{ sub(\"/usr\",   \"$green/usr$reset_color\"); \
           sub(\"/bin\",   \"$blue/bin$reset_color\"); \
           sub(\"/opt\",   \"$cyan/opt$reset_color\"); \
           sub(\"/sbin\",  \"$purple/sbin$reset_color\"); \
           sub(\"/local\", \"$brown/local$reset_color\"); \
           print }"
}

# Random password generator
# Alternative:  openssl rand -base64 12
randpassgen() {
  local number=$1
  local lenght=$2
  : ${number:='1'}
  : ${lenght:='16'}
  local prefix='https://www.random.org/strings'
  local suffix='digits=on&upperalpha=on&loweralpha=on&unique=off&format=plain&rnd=new'
  local url="$prefix/?num=$number&len=$lenght&$suffix"
  [ "$(command -v curl)" ] && curl --silent "$url"
}

# Set title of terminal window/tab
# $*: string
title() {
  local title=$*
  echo -ne "\\033]0;$title\\007"
}
