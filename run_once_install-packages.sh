#!/bin/bash 

cd "$HOME" || return 
system_type=$(uname -s)
if [[ $system_type == "Darwin" ]]; then
  echo "> Mac" 
  
  # fix that zsh nonsense
  brew install bash
  brew install git
  brew install neovim
  
  brew install python
  pip3 install --upgrade setuptools
  pip3 install --upgrade pip

  brew install yarn
  brew install golang
  brew install direnv
  brew install hugo
  brew install z

  brew cask install docker
  brew cask install iterm2
  
  brew install bash-completion@2
  brew install starship

  curl https://sh.rustup.rs -sSf | sh

  defaults write com.apple.dock workspaces-auto-swoosh -bool NO
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  defaults write com.apple.screencapture location /Users/$USER/Pictures/Screenshots
  defaults write com.apple.dock autohide-time-modifier -float 0.3
  defaults write com.apple.dock autohide-delay -float 0
  killall Dock


  git config --global core.excludesfile ~/.gitignore
  sudo chsh -s /usr/local/bin/bash $USER
fi

if [[ $system_type == "Linux" ]]; then 
	sudo apt-get install -y $(cat ~/.local/share/chezmoi/pkglist.txt | awk '{print $1}')
  
    cd ~/bin/setup/
    ./bashmarks.sh
	./go.sh  
	./neovim.sh 
	./nvm.sh  
	./rust.sh  
	./yarn.sh   

fi

nvim --headless +PlugInstall +UpdateRemotePlugins +qall

source $HOME/.cargo/env