#!/bin/bash

echo "Install Setup Script for Ubuntu"

#############################################
# delete old dotfiles
#############################################

sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.config/nvim > /dev/null 2>&1
sudo rm -rf ~/.dircolors > /dev/null 2>&1
sudo rm -rf ~/dotfiles > /dev/null 2>&1
sudo rm -rf ~/.oh-my-zsh > /dev/null 2>&1


#############################################
# Colors for echo
#############################################

# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}


# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#############################################
# Install all packages
#############################################

cecho "Beginning installation script. Updating system..." $red
sudo apt update && sudo apt upgrade
sudo apt install git

# installing brave
cecho "Installing brave browser..." $red
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

# spotify
cecho "Installing spotify..." $red
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# zsh
cecho "Installing zsh..." $red

sudo apt install zsh
#sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# pyenv
sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev 
curl https://pyenv.run | bash

# gnome terminal theme
cecho "Installing gnome-terminal theming..." $red
sudo apt-get install dconf-cli
git clone https://github.com/dracula/gnome-terminal $HOME/Downloads/gnome-terminal
$HOME/Downloads/gnome-terminal/install.sh

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage 
sudo mv nvim.appimage /usr/local/bin/nvim

sudo apt-get install npm
sudo npm i -g pyright

#misc tools
cecho "Installing some more tools..." $red
sudo apt install xclip fzf ripgrep tmux flameshot

#############################################
### Generate ssh keys & add to ssh-agent
### See: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
#############################################
echo
echo "Generating ssh keys, adding to ssh-agent..."
read -p 'Input email for ssh key: ' useremail

echo "Use default ssh file location, enter a passphrase: "
ssh-keygen -t rsa -b 4096 -C "$useremail"  # will prompt for password
eval "$(ssh-agent -s)"

echo "$(cat $HOME/.ssh/id_rsa.pub)" | xclip -sel clip
echo "$(cat $HOME/.ssh/id_rsa.pub)" 
# Set continue to false by default.
CONTINUE=false

echo
echo "SSH key is copied to clipboard..."
echo "Setup new key here: https://github.com/settings/keys"
cecho "Did you finish the setup at Github? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

echo "Continuing with dotfiles setup!"


#############################################
### Generate ssh keys & add to ssh-agent
#############################################

git clone git@github.com:gearson/dotfiles.git $HOME/dotfiles

cp $HOME/dotfiles/fonts/Sauce-Code-Pro-Nerd-Font-Complete-Mono.ttf $HOME/.local/share/fonts
# if you want to install font for all users
# sudo cp $HOME/dotfiles/fonts/Sauce-Code-Pro-Nerd-Font-Complete-Mono.ttf /usr/local/share/fonts



# symlinks
#=============

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme
ln -sf ~/dotfiles/.dircolors ~/.dircolors
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/nvim ~/.config/nvim

cecho "Finished setup. Please check manual configuration section of the README.md file!" $red
