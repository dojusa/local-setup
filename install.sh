#!/bin/bash
set -euo pipefail

echo "instaling xcode tool belt"
xcode-select --install

echo "installing brew"
ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”

echo "installing relevant apps"
brew cask install google-chrome
brew cask install slack
brew cask install spectacle
brew cask install visual-studio-code
brew cask install spotify

echo "installing development apps"
brew cask install iterm2
brew install zsh

echo "installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh
