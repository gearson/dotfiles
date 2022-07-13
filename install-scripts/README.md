# Setting up a new computer

This folder contains installation scripts for setting up a new computer. It's very personalized and you probably don't want to just blindly run it.

ubuntu-setup.sh is for Ubuntu based system. Probably works on most distros that use apt. Adding a more minimal install with only terminal and neovim stuff soonish.

## Install from script:

Run this in the terminal:
```bash
bash <(curl -s https://raw.githubusercontent.com/gearson/dotfiles/main/install-scripts/ubuntu-setup.sh)
```

## Manual Configurations
A couple of apps need to be configured manually.

* Gnome Terminal
    * adjust cursor color
        * black to #42E66C
        * white to #282A36
    * change font to **Sauce Code Pro Nerd Font Mono**
    * add custom command to start with zsh in Command -> Run a custom command instead of my shell
    * disable terminal bell
* Neovim
    * to finish Neovim, start it with vim, quit (packer installs at the first startup)
    * start again, run :PackerInstall
    * add some treesitter install
        * :TSInstall python
        * :TSInstall json
        * :TSInstall markdown
* TMUX
    * ctrl-a I to initialize plugin installation
* Gnome
    * customize dock (remove stuff, reorder etc.)
    * change appearance to dark
    * set right alt to compose key (for these german letters -> äöü)
    * change time formate to AM/PM
    * set Microphone mute/unmute to Numpad *
    * add flameshot shortcut (command=flameshot gui), super+shift+s
    * add bluetooth shortcut (command=gnome-control-center bluetooth), super+shift+b
* Gnome Extensions
    * https://extensions.gnome.org/extension/1720/weeks-start-on-monday-again/
    * https://extensions.gnome.org/extension/10/windownavigator/
    * https://extensions.gnome.org/extension/5135/audio-selector/
    * https://extensions.gnome.org/extension/906/sound-output-device-chooser/ -> alternative sound device chooser
* if you want chrome: https://www.google.com/chrome/?platform=linux
* install teams via deb package from here: https://www.microsoft.com/de-de/microsoft-teams/download-app

