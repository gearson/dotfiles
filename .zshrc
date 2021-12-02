# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/deniz/.oh-my-zsh"
export AOC_SESSION=53616c7465645f5f566917a12afa78ced353d875d83ef340bf230d799667dd186f47a19f7732cdfc733a635273be01cf

eval `dircolors ~/dotfiles/.dircolors`
ZSH_THEME="mytheme"
#export TERM=xterm-256color
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed

# this is in mytheme. It's an adjusted robbyrussell
# PROMPT=' %{$fg[cyan]%}%c $(git_prompt_info)'
# PROMPT+="%(?:%{$fg[green]%}> :%{$fg[red]%}> )%{$reset_color%}" 
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}("
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}) %{$fg[red]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%})"


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

alias gearsongit="ssh-add -D && ssh-add ~/.ssh/gearson_id_rsa && ssh -T git@github.com"
alias sdgit="ssh-add -D && ssh-add ~/.ssh/sd_id_rsa && ssh -T git@github.com"

alias dotfiles="cd ~/dotfiles && la"
alias vimrc="vim ~/dotfiles/nvim/lua/settings.lua"
alias zshrc="vim ~/dotfiles/.zshrc"

alias cdcode="cd ~/code/ && p"
alias cd-nifti-lstm="cd ~/code/sd/ds-nifti-lstm"
alias cdaoc="cd ~/code/gearson/advent-of-code"

alias p='nvim `fzf --preview="batcat --color always {}"`'

alias formatjson="vim ~/Documents/temp.json"
# check which terminal is used and run tmux. This is to avoid tmux in the integrated terminal of vscode.
current_terminal="$(ps -p$PPID -o cmd=)"
if [[ $current_terminal =~ 'gnome-terminal' ]]; then tmux attach || tmux new; fi
if [[ $current_terminal =~ 'cool-retro-term' ]]; then tmux attach || tmux new; fi
if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi

# to get a correct prompt when using pyenv
function virtualenv_info { 
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘ 
}
# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

export PATH="/home/deniz/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


####################
# Additional Options
####################

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
