PROMPT=' %{$fg[cyan]%}%c $(git_prompt_info)'
PROMPT+="%(?:%{$fg[green]%}> :%{$fg[red]%}> )%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}) %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%})"

