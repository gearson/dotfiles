# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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
alias active="ae playground && python ~/code/personal/playground/active.py"
alias pag-aws="aws sso login --profile pag-aws"
alias awake="caffeinate -d"


alias dotfiles="cd ~/dotfiles && la"
alias vimrc="vim ~/dotfiles/nvim/lua/settings.lua"
alias zshrc="vim ~/dotfiles/.zshrc"

alias cdcode="cd ~/code/"
alias sdcode="cd ~/code/sd/ && tmux rename-window sd"
alias personalcode="cd ~/code/personal/"


alias gearsongit="ssh-add -D && ssh-add ~/.ssh/id_rsa && ssh -T git@github.com && git config --global user.name 'gearson' && git config --global user.email 'deniz.dohmen@gmail.com'"
alias sdgit="ssh-add -D && ssh-add ~/.ssh/sd_rsa && ssh -T git@github.com && git config --global user.name 'deniz-dohmen_omcitcld' && git config --global user.email 'deniz.dohmen@smart-digital.de'"
# to get a correct prompt when using pyenv
function virtualenv_info { 
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘ 
}
# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1


export PATH="$PATH:$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit


source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
