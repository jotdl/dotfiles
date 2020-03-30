#!/bin/bash 

# requires curl and sudo

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
  brew install go
  brew install kubectl
  brew install direnv
  brew install hugo
  brew install z

  brew cask install docker
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion /usr/local/etc/bash_completion.d/docker
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion /usr/local/etc/bash_completion.d/docker-machine
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion /usr/local/etc/bash_completion.d/docker-compose

  kubectl completion bash > ~/.kube/kubectl_autocompletion

  brew cask install iterm2
  
  brew install bash-completion@2
  brew install starship

  defaults write com.apple.dock workspaces-auto-swoosh -bool NO
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  defaults write com.apple.screencapture location /Users/$USER/Pictures/Screenshots
  defaults write com.apple.dock autohide-time-modifier -float 0.3
  defaults write com.apple.dock autohide-delay -float 0
  killall Dock

  sudo chsh -s /usr/local/bin/bash $USER
fi

if [[ $system_type == "Linux" ]]; then 
	
  if hash apt-get 2>/dev/null; then
  
    sudo apt-get install -y libssl-dev
    sudo apt-get install -y $(cat ~/.local/share/chezmoi/pkglist.txt | awk '{print $1}')
  
  else
  
    sudo pacman -Sy openssl
    sudo pacman -Sy $(cat ~/.local/share/chezmoi/pkglist.txt | awk '{print $1}')
  
  fi

    # go setup
  sudo rm -rf /usr/local/go
  sudo mkdir -p /usr/local/go && curl -Ls https://storage.googleapis.com/golang/go1.14.1.linux-amd64.tar.gz | sudo tar xvzf - -C 
fi

git config --global core.excludesfile ~/.gitignore

curl https://sh.rustup.rs -sSf | sh

if [[ $system_type == "Linux" ]]; then 
  source $HOME/.cargo/env
  cargo install --force starship  
fi

nvim --headless +PlugInstall +UpdateRemotePlugins +qall

source $HOME/.cargo/env