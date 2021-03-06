#!/bin/bash 

cd "$HOME" || return 
system_type=$(uname -s)

if [[ $system_type == "Darwin" ]]; then
  echo "Hello Mac User!"
  echo "Installing Homebrew..."
  # install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # install the git from homebrew
  brew install git
fi

if [[ $system_type == "Linux" ]]; then 
  echo "Hello Linux User!"

	if hash apt-get 2>/dev/null; then
    sudo apt update
    sudo apt install -y git curl
  else
    sudo pacman -Syu git curl
  fi
fi

curl -sfL https://git.io/chezmoi | sh

export PATH=$HOME/bin:$PATH
chezmoi init --apply --verbose https://github.com/jotdl/dotfiles