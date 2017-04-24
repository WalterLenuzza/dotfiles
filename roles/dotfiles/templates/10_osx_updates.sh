#!/usr/bin/env bash


# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Ask for the administrator password upfront (and extend timeout by 5 mins)
e_header "Ask for the administrator upfront"
sudo -v

# MacOSX App Store updates
e_header "MacOSX App Store updates"
sudo softwareupdate -i -a && e_success 'MacOSX up-to-date'

# Install XCode Commandline Tools
e_header "XCode Commandline Tools"
if [[ ! "$(xcode-select -p)" ]]; then
  xcode-select --install && e_success 'XCode Commandline Tools installed'
else
  e_success 'XCode Commandline Tools already installed'
fi
