#!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# sudo keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brewfile contents
brew bundle

# Configure macos defaults
./.macos

# Install vscode extensions
cat ~/.config/vscode/extensions.list | grep -v '^#' | xargs -L1 code --install-extension

