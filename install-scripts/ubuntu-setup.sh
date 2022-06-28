#!/bin/bash

echo "Install Setup Script for Ubuntu"

# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#############################################
# delete old dotfiles
#############################################

sudo rm -rf $HOME/.zshrc > /dev/null 2>&1
sudo rm -rf $HOME/.tmux.conf > /dev/null 2>&1
sudo rm -rf $HOME/.tmux > /dev/null 2>&1
sudo rm -rf $HOME/.config/nvim > /dev/null 2>&1
sudo rm -rf $HOME/.dircolors > /dev/null 2>&1
sudo rm -rf $HOME/dotfiles > /dev/null 2>&1
sudo rm -rf $HOME/.oh-my-zsh > /dev/null 2>&1
sudo rm -rf $HOME/.local/share/fonts > /dev/null 2>&1

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

#############################################
# Install all packages
#############################################

cecho "Beginning installation script. Updating system..." $red
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git

# installing brave
cecho "Installing brave browser..." $red
sudo apt install -y apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y

sudo apt install -y brave-browser

# spotify
cecho "Installing spotify..." $red
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y && sudo apt-get install -y spotify-client

# zsh
cecho "Installing zsh and oh-my-zsh..." $red

sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# pyenv
cecho "Setting up pyenv and all dependencies..." $red

sudo apt-get update -y; sudo apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev 
curl https://pyenv.run | bash

# gnome terminal theme
cecho "Installing gnome-terminal theming..." $red

sudo apt-get install -y dconf-cli
git clone https://github.com/dracula/gnome-terminal $HOME/Downloads/gnome-terminal
$HOME/Downloads/gnome-terminal/install.sh
sudo rm -rf $HOME/Downloads/gnome-terminal > /dev/null 2>&1

# neovim
# TODO: include stuff for other languages?
cecho "Installing Neovim and dependencies for pyright..." $red

sudo apt install -y libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage 
sudo mv nvim.appimage /usr/local/bin/nvim

sudo apt-get install -y npm
sudo npm i -g pyright

#misc tools
cecho "Installing some more tools..." $red
sudo apt install -y xclip fzf ripgrep tmux flameshot
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
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

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "The rest of the script will break without this. Exiting..." $red
  exit
fi

#############################################
### Generate ssh keys & add to ssh-agent
#############################################
echo
cecho "Continuing with dotfiles setup!" $red

git clone git@github.com:gearson/dotfiles.git $HOME/dotfiles

sudo rm -rf $HOME/.local/share/fonts > /dev/null 2>&1
mkdir $HOME/.local/share/fonts
cp $HOME/dotfiles/fonts/Sauce-Code-Pro-Nerd-Font-Complete-Mono.ttf $HOME/.local/share/fonts
# if you want to install font for all users
# sudo cp $HOME/dotfiles/fonts/Sauce-Code-Pro-Nerd-Font-Complete-Mono.ttf /usr/local/share/fonts



#############################################
### Symlinks of dotfiles
#############################################

ln -sf $HOME/dotfiles/.zshrc ~/.zshrc
ln -sf $HOME/dotfiles/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme
ln -sf $HOME/dotfiles/.dircolors ~/.dircolors
ln -sf $HOME/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf $HOME/dotfiles/nvim ~/.config/nvim

#############################################
### Some configs
#############################################

gnome-extensions disable ubuntu-dock@ubuntu.com


cecho "Finished setup. Please check manual configuration section of the README.md file!" $red
