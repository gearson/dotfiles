# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/deniz/.oh-my-zsh"

eval `dircolors ~/dotfiles/.dircolors`

ZSH_THEME="mytheme"

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
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

########
# Aliases
########

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias ae="deactivate &> /dev/null; source ./venv/bin/activate"
alias de="deactivate"
alias sdenv="source ./.env && set -a && source ./.env && set +a"
alias cdcode="cd ~/code/"
alias vim="nvim"
alias vpn="tmux rename-window vpn && cd ~/dotfiles/SD-VPN && sudo openvpn ~/dotfiles/SD-VPN/mail_smart_digital_de_VPN1.ovpn"

alias gearsongit="ssh-add -D && ssh-add ~/.ssh/id_rsa_gearson && ssh -T git@github.com"
alias sdgit="ssh-add -D && ssh-add ~/.ssh/id_rsa_sd && ssh -T git@github.com"

# Other Stuff 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


####################
# Additional Options
####################
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
