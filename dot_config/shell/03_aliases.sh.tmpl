#!/usr/bin/env sh

# Shared shell settings (bash/zsh)

# Aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias dir='dir --color=auto'
# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases: list files
if [ "$(command -v exa)" ]; then
  alias v='exa -a --git --long --header --time-style=long-iso'                     # Long listing
  alias vs='exa -a --git --long --header --time-style=long-iso --sort=size'        # Sort by size
  alias vt='exa -a --git --long --header --time-style=long-iso --sort=oldest'      # Sort by mtime-reversed
  alias vx='exa -a --git --long --header --time-style=long-iso --group --extended' # Show ACLs and xattrs
  alias tree='exa -a --ignore-glob=".git" --tree'
else
  alias la='ls -A --color=auto'
  alias v='ls -lhA'    # Long listing
  alias vs='ls -lhASr' # Sort by size-reversed
  alias vt='ls -lhAtr' # Sort by mtime-reversed
  alias vx='ls -lhAe@' # Show ACLs and xattrs
  alias tree='tree -aC -I .git --dirsfirst'
fi

# Aliases: disk usage
if [ "$(command -v ncdu)" ]; then
  alias d='ncdu'
else
  alias d='du -csh | sort -nk'
fi

# Aliases: misc
alias df='df -h'
alias ln='ln -v'
alias mkdir='mkdir -p'
alias mv='mv -vi'
alias p='ps fax'
alias rm='rm -v'

alias mc='mc -a'
alias tmux='tmux -2'
alias top='htop'

alias rg='ag'
alias ack='ag'

alias docker_nas='export DOCKER_HOST=tcp://192.168.1.254:2376 DOCKER_TLS_VERIFY=1'
alias clean_DS_Store='find . -name *.DS_Store -type f -print -delete'
alias dotfiles='git --git-dir="$XDG_DATA_HOME"/dotfiles --work-tree="$HOME"'

alias yay-install='yay -Sy --needed --noconfirm - < "$XDG_CONFIG_HOME"/yay/packagelist'
alias yay-upgrade='yay -Syu --devel --timeupdate'

# Replace 'ps fax' on MacOSX
if [ "$(uname)" = 'Darwin' ]; then
  alias ps='pstree -U | grep -vE (/System/Library/|/usr/)'
fi

# Set default browser
export BROWSER='firefox'

# Default programs
if [ "$(command -v most)" ]; then
  export PAGER='most'
  alias less='most'
else
  export PAGER='less'
  export LESS='-FMnqrX'
fi

# Editor
[ "$(command -v vim)" ] && {
  alias vi='vim'
  export EDITOR='vim'
  export VISUAL='vim'
}

[ "$(command -v nvim)" ] && {
  alias vi='nvim'
  export EDITOR='nvim'
  export VISUAL='nvim'
}

[ "$(command -v subl)" ] && {
  alias sub='subl -a .'
}

# Diff
[ "$(command -v icdiff)" ] && {
  alias diff='icdiff'
}

# Kubernetes
alias k='kubectl'
