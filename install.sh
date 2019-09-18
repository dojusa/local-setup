#!/bin/bash
set -euo pipefail

echo "instaling xcode tool belt"
xcode-select --install

echo "installing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "installing relevant apps"
brew cask install google-chrome
brew cask install firefox
brew cask install slack
brew cask install spectacle
brew cask install visual-studio-code
brew cask install spotify

echo "installing development apps"
brew cask install adoptopenjdk
brew cask install docker
brew cask install iterm2
brew install openssl
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

echo "installing golang"
asdf plugin-add golang
asdf install golang 1.12
asdf global golang 1.12

mkdir -p ~/workspace/go
echo '\nexport GOPATH=$HOME/workspace/go' >> ~/.zshrc
echo '\nexport PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
source ~/.zshrc

echo "installing erlang and elixir"
asdf plugin-add erlang
ERLANG_OPENSSL_PATH="/usr/local/opt/openssl" asdf install erlang 22.0
asdf global erlang 22.0

asdf plugin-add elixir
asdf install elixir 1.9.1-otp-22
asdf global elixir 1.9.1-otp-22

echo "installing pip"
sudo easy_install pip
sudo pip install --upgrade pip

echo "configuring global .gitignore"
touch ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
echo '\n**/.elixir_ls/' >> ~/.gitignore_global

echo "configuring global pull.rebase true"
git config --global pull.rebase true
