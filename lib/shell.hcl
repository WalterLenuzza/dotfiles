file.directory "config" {
  destination = "{{param `prefix`}}/.config/shell"
  create_all  = true
}

file.directory "less" {
  destination = "{{param `prefix`}}/.cache/less"
  create_all  = true
}

file.content "shellrc" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/shell/rc"

  content = <<EOF
# ~/.config/shell/rc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Environment variables
# XDG
XDG_CONFIG_HOME='{{param `prefix`}}/.config'
XDG_CACHE_HOME='{{param `prefix`}}/.cache'
XDG_DATA_HOME='{{param `prefix`}}/.config'
. '{{param `prefix`}}/.config/user-dirs.dirs'

# Set locale
LANG='{{param `locale`}}'.UTF8

# 256-color terminal
SHELL='{{param `shell`}}'
TERM='xterm-256color'

# Pager
PAGER='less'
LESS='-FMnqrX' # Quit if only 1 screen, show colors, don't clear
LESSHISTFILE='{{param `prefix`}}/.cache/less/history'

# Aliases
alias  v='ls -lhA'

# Sort by size-reversed
alias vs='ls -lhASr'

# Sort by mtime-reversed
alias vt='ls -lhAtr'

# Show ACLs and xattrs
alias vx='ls -lhAe@'

alias     d='du -csh | sort -nk'
alias    df='df -h'
alias    ln='ln -v'
alias mkdir='mkdir -p'
alias    mv='mv -vi'
alias    rm='rm -v'

alias   mc='mc -a'
alias tmux='tmux -2'
alias tree='tree -aC -I .git --dirsfirst'

[ $(uname) = 'Darwin' ] && \
  alias clean_DS_Store='find . -name *.DS_Store -type f -print -delete'

# Editor
# Check if Vim is installed
command -v vim >/dev/null 2>&- && \
  alias vi='vim'

# Check if NeoVim is installed
command -v nvim >/dev/null 2>&- && \
  alias  vi='nvim' && \
  alias vim='nvim'

EDITOR='vi'

# Colorize
# grep
alias grep='grep --color=auto'

# ls
case "$(uname)" in
  Darwin)
    alias ls='ls -G'
    ;;
  Linux)
    alias ls='ls --color=auto'
    ;;
esac

# man
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

# $PATH
path() {
  local blue="\033[1;34m"
  local green="\033[0;32m"
  local cyan="\033[0;36m"
  local purple="\033[0;35m"
  local brown="\033[0;33m"
  local reset_color="\033[0m"
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$green/usr$reset_color\"); \
           sub(\"/bin\",   \"$blue/bin$reset_color\"); \
           sub(\"/opt\",   \"$cyan/opt$reset_color\"); \
           sub(\"/sbin\",  \"$purple/sbin$reset_color\"); \
           sub(\"/local\", \"$brown/local$reset_color\"); \
           print }"
}

# Functions
# Change directory and list its contents straight away
c() (
  local new_directory="$*"
  if [ $# -eq 0 ]; then
      new_directory=${HOME}
  fi
  builtin cd "${new_directory}" && ls -lhAG
)

# Print a color test table
# https://github.com/mikker/dotfiles/blob/master/bin/colortest.sh
colors_table() {
  local T='gYw'   # The test text

  echo -e "\n                 40m     41m     42m     43m\
    44m     45m     46m     47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
    '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
    '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
}

# Docker clean all unused containers/images
docker_cleanup() {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# Docker linting
docker_lint() {
  docker run -it --rm -v "$PWD":/root projectatomic/dockerfile-lint dockerfile_lint
}

# Usage: extract <file>
# Note: .dmg/hdiutil is Mac OS X-specific.
# http://nparikh.org/notes/zshrc.txt
extract () {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)  tar -jxvf $1                     ;;
      *.tar.gz)   tar -zxvf $1                     ;;
      *.bz2)      bunzip2 $1                       ;;
      *.dmg)      hdiutil mount $1                 ;;
      *.gz)       gunzip $1                        ;;
      *.tar)      tar -xvf $1                      ;;
      *.tbz2)     tar -jxvf $1                     ;;
      *.tgz)      tar -zxvf $1                     ;;
      *.zip)      unzip $1                         ;;
      *.ZIP)      unzip $1                         ;;
      *.pax)      cat $1 | pax -r                  ;;
      *.pax.Z)    uncompress $1 --stdout | pax -r  ;;
      *.rar)      unrar x $1                       ;;
      *.Z)        uncompress $1                    ;;
      *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
     esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Log the message to standard error, as well as the system log
# Ref. `man logger` and `man syslog`
# $1: message to log
# $2: priority (optional, defaults to user.notice)
# $3: tag (optional)
log() {
  local message="$1"
  local priority="$([ -z $2 ] || echo -n "-p user.$2")"
  local tag="$([ -z $3 ] || echo -n "-t $3")"
  logger -s $priority $tag $message
}

# Replace 'ps fax' on MacOSX
ps() {
  if [ $(uname) = 'Darwin' ]; then
    pstree -U | grep -vE '(/System/Library/|/usr/)';
  else
    command ps $@;
  fi
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
  command -v curl >/dev/null 2>&- && curl --silent $url
}

# Set title of terminal window/tab
# $*: string
title() {
  local title=$*
  echo -ne "\033]0;$title\007"
}

# Weather (defaults to London, EU)
# $1: city
weather() {
  local city=$1
  : ${city:='London'}
  command -v curl >/dev/null 2>&- && curl --silent http://wttr.in/$city
}

# Code
### Golang
#export GOPATH="XDG_DEVEL_DIR/golang"
#export PATH="$PATH:$GOPATH/bin"
#
### Python (pyenv)
#export PYENV_ROOT="XDG_DEVEL_DIR/python"
#export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV='true'
## TEMP: Prompt changing will be removed from future release
## export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#[ $(command -v pyenv) ] && eval "$(pyenv init -)"
#[ $(command -v pyenv-virtualenv-init) ] && eval "$(pyenv virtualenv-init -)"
#
# Ruby (RBenv)
#export RBENV_ROOT="$XDG_DEVEL_DIR/ruby"
#[ $(command -v rbenv) ] && eval "$(rbenv init -)"

EOF
}
