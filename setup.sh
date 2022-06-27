#!/bin/bash

echo "Install Setup Script for Ubuntu"

# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#############################################
# Install all packages
#############################################


#############################################
# delete old dotfiles
#############################################

# sudo rm -rf ~/.vim > /dev/null 2>&1
# sudo rm -rf ~/.vimrc > /dev/null 2>&1
# sudo rm -rf ~/.bashrc > /dev/null 2>&1
# sudo rm -rf ~/.zshrc > /dev/null 2>&1
# sudo rm -rf ~/.tmux > /dev/null 2>&1
# sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
# sudo rm -rf ~/.config/nvim > /dev/null 2>&1
# sudo rm -rf ~/.dircolors > /dev/null 2>&1
# sudo rm -rf ~/.oh-my-zsh > /dev/null 2>&1


#############################################
### Generate ssh keys & add to ssh-agent
### See: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
#############################################

echo "Generating ssh keys, adding to ssh-agent..."
read -p 'Input email for ssh key: ' useremail

echo "Use default ssh file location, enter a passphrase: "
ssh-keygen -t rsa -b 4096 -C "$useremail"  # will prompt for password
eval "$(ssh-agent -s)"
#=============
# symlinks
#=============

# ln -sf ~/dotfiles/.zshrc ~/.zshrc
# ln -sf ~/dotfiles/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme
# ln -sf ~/dotfiles/.dircolors ~/.dircolors
# ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
# ln -sf ~/dotfiles/nvim ~/.config/nvim

