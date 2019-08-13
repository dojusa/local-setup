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
brew cask install adoptopenjdk
brew cask install docker
brew cask install iterm2
brew install docker-compose
brew install zsh

echo "installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

echo "installing google cloud sdk"
brew cask install google-cloud-sdk
echo '\nexport PATH=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

echo "installing asdf"
brew install asdf
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc
echo '\nexport ASDFROOT=$HOME/.asdf' >> ~/.zshrc
echo '\nexport ASDFINSTALLS=$HOME/.asdf/installs' >> ~/.zshrc
source ~/.zshrc

echo "installing programming languages"
asdf plugin-add golang
asdf install golang 1.12
asdf global golang 1.12

mkdir -p ~/workspace/go
#echo "\nGOV=$(asdf current golang | awk '{print $1}')" >> ~/.zshrc
#echo '\nexport GOROOT=$ASDFINSTALLS/golang/$GOV/go' >> ~/.zshrc
echo '\nexport GOPATH=$HOME/workspace/go' >> ~/.zshrc
echo '\nexport PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
source ~/.zshrc

asdf plugin-add erlang
asdf install erlang 22.0
asdf global erlang 22.0

asdf plugin-add elixir
asdf global elixir 1.9.1-otp-22
