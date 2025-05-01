#!/bin/bash
set -euo pipefail

# Update and install essentials
sudo apt update
sudo apt upgrade -y
sudo apt install -y git zsh curl

# Install Oh My Zsh non-interactively
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as the default shell
chsh -s "$(which zsh)"

# Clone Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"

# Set Powerlevel10k as the theme in .zshrc
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "${HOME}/.zshrc"

# Clone zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

# Clone zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

# Enable plugins in .zshrc (preserves any existing plugins)
sed -i '/^plugins=/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' "${HOME}/.zshrc"

# Inform the user
echo "Installation complete. Please restart your terminal or run 'exec zsh' to start using Zsh with Powerlevel10k."
