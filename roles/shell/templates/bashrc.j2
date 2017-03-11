#!/usr/bin/env bash

# If the $HOME/.bash.d directory exists, source all readable files
# starting with two digits, unless they have a '.disabled' suffix
function source_dotfiles() {
  if [ -d "$HOME"/.bash.d ]; then
    GLOBIGNORE='*.disabled'
      for filename in "$HOME"/.bash.d/[0-9][0-9]_*; do
        [ -f "$filename" ] && source "$filename"
      done
    unset GLOBIGNORE
  fi
}

# Main (if interactive)
[ -n "$PS1" ] && source_dotfiles && unset source_dotfiles

