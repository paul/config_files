# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# aliases
if [ -e "$HOME/.ec2" ]; then
  source "$HOME/.ec2/env.sh"
fi


# vi mode
bindkey -v

# use incremental search
bindkey ^R history-incremental-search-backward

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

if [[ -s /Users/rando/.rvm/scripts/rvm ]] ; then source /Users/rando/.rvm/scripts/rvm ; fi

