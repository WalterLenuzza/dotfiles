#!/usr/bin/env bash


# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Set user's shell to /usr/local/bin/bash (BASHv4 installed via Homebrew)
e_header "Use BASHv4 via Homebrew"
if [ ! "$SHELL" == '/usr/local/bin/bash' ]; then
  # Append HomeBrew's BASHv4 to /etc/shells
  grep -Fxq /usr/local/bin/bash /etc/shells || sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
  chsh -s '/usr/local/bin/bash' "$USER" || { e_error "BASHv4 not set" && return 1; }
fi

e_success "BASHv4 set for user $USER"

[ ! "$BASH_VERSINFO" == '4' ] || e_error "Not running on BASHv4, please logout"
