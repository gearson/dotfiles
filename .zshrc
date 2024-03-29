# check which terminal is used and run tmux. This is to avoid tmux in the integrated terminal of vscode.
# current_terminal="$(ps -p$PPID -o cmd=)"
if [ -z $TMUX ]; then tmux; fi

# fixes some color stuff
# if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

eval `dircolors ~/dotfiles/.dircolors`
ZSH_THEME="mytheme"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(virtualenv git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

########
# Aliases
########

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias ae="deactivate &> /dev/null; pyenv activate"
alias de="pyenv deactivate"
alias sdenv="source ./.env && set -a && source ./.env && set +a"
alias vim="nvim"
alias vpn="tmux rename-window vpn && cd ~/dotfiles/SD-VPN && sudo openvpn ~/dotfiles/SD-VPN/mail_smart_digital_de_VPN1.ovpn"
alias active="ae playground && python ~/code/personal/playground/active.py"

# alias gearsongit="ssh-add -D && ssh-add ~/.ssh/gearson_id_rsa && ssh -T git@github.com"
# alias sdgit="ssh-add -D && ssh-add ~/.ssh/sd_id_rsa && ssh -T git@github.com"

alias dotfiles="cd ~/dotfiles && la"
alias vimrc="vim ~/dotfiles/nvim/lua/settings.lua"
alias zshrc="vim ~/dotfiles/.zshrc"

alias cdcode="cd ~/code/"
alias sdcode="cd ~/code/sd/ && tmux rename-window sd"
alias personalcode="cd ~/code/personal/"

alias cdnifti="cd ~/code/sd/ds-nifti-lstm && tmux rename-window nifti-lstm"

alias p='nvim `fzf --preview="batcat --color always {}"`'
alias sd="cd ~ && cd \$(find * -not -path '*/.*' -type d| fzf)"

alias gearsongit="ssh-add -D && ssh-add ~/.ssh/id_rsa && ssh -T git@github.com && git config --global user.name 'gearson' && git config --global user.email 'deniz.dohmen@gmail.com'"
alias sdgit="ssh-add -D && ssh-add ~/.ssh/sd_rsa && ssh -T git@github.com && git config --global user.name 'deniz-dohmen_omcitcld' && git config --global user.email 'deniz.dohmen@smart-digital.de'"
# to get a correct prompt when using pyenv
function virtualenv_info { 
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘ 
}
# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `pipx` on 2021-12-03 23:44:54
export PATH="$PATH:/home/deniz/.local/bin"

# pyenv path stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# adding go to path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
