#!/bin/bash

set -e

export http_proxy="http://127.0.0.1:20171" && export https_proxy="http://127.0.0.1:20171"

sed -i "s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list
sed -i "s/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list
apt update
apt install build-essential git zsh wget -y

rm -rf ~/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i "s/plugins=(git/plugins=(git zsh-autosuggestions/" ~/.zshrc
