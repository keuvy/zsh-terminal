#!/bin/bash
set -eux pipefail

sudo apt update
sudo apt upgrade -y

sudo apt install -y git zsh curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)