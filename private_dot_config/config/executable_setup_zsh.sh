#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to print messages in green
function echo_green {
    echo -e "\e[32m$1\e[0m"
}

# Function to print messages in yellow
function echo_yellow {
    echo -e "\e[33m$1\e[0m"
}

# 1. Install Zsh
echo_green "Installing Zsh..."
sudo apt update && sudo apt install -y zsh

# 2. Install Oh My Zsh
echo_green "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Installing plugins
echo_green "Installing Plugins..."

# Install zsh-autosuggestions plugin
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo_green "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo_yellow "zsh-autosuggestions already installed."
fi


# Install zsh-syntax-highlighting plugin
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo_green "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo_yellow "zsh-syntax-highlighting already installed."
fi

# Install Dracula theme
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula" ]; then
    echo_green "Installing Dracula theme..."
    git clone https://github.com/dracula/zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula
    ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula/dracula.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula.zsh-theme
else
    echo_yellow "zsh-autosuggestions already installed."
fi

# Install catppuccin theme
echo_green "Installing Catppuccin theme..."
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/themes/catppuccin_macchiato

# Install fzf
if ! command -v fzf &> /dev/null; then
    echo_green "Installing fzf..."
    sudo apt install fzf -y

    mkdir -p ~/.config/fzf/ 
    cp /usr/share/doc/fzf/examples/key-bindings.zsh ~/.config/fzf/key-bindings.zsh
    cp /usr/share/doc/fzf/examples/completion.zsh ~/.config/fzf/completion.zsh
else
    echo_yellow "fzf already installed."
fi

echo_green "Installation and configuration complete!"
