#!/usr/bin/env bash


# Configure git username/email
e_header "Configure git username/email"

read -e -p 'Github name: ' answer
git config --global user.name "$answer" && e_success "GitHub user set"
read -e -p 'Github email: ' answer
git config --global user.email "$answer" && e_success "GitHub email set"
unset answer


# On MacOSX store credentials in the KeyChain. Abort if not OSX.
is_osx || return 1
git config --global credential.helper osxkeychain && \
  e_success "Store credentials in MacOSX's Keychain"
