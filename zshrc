# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd
cdpath=(~/Code ~/Code/api)

# use vim as an editor
export EDITOR=vim
export PAGER=most
export SHELL=/bin/zsh

# Homebrew
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# aliases
if [ -e "$HOME/.ec2" ]; then
  source "$HOME/.ec2/env.sh"
fi


# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

# Key Bindings

bindkey -e

# Make home/end work
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# use incremental search
bindkey "^R" history-incremental-search-backward

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# rebind up/down to search history
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# My options
setopt append_history       # append history list to the history file (important for multiple parallel zsh sessions!)
setopt extended_history     # save each command's beginning timestamp and the duration to the history file
setopt histignorespace      # remove command lines from the history list when
setopt extended_glob        # in order to use #, ~ and ^ for filename generation
                            # grep word *~(*.gz|*.bz|*.bz2|*.zip|*.Z) ->
                            # -> searches for word not in compressed files
                            # don't forget to quote '^', '~' and '#'!
setopt notify               # report the status of backgrounds jobs immediately
setopt hash_list_all        # Whenever a command completion is attempted, make sure \
                            # the entire command path is hashed first.
setopt completeinword       # not just at the end
setopt auto_pushd           # make cd push the old directory onto the directory stack.
setopt nonomatch            # try to avoid the 'zsh: no matches found...'
setopt nobeep               # avoid "beep"ing


if [[ -s /Users/rando/.rvm/scripts/rvm ]] ; then source /Users/rando/.rvm/scripts/rvm ; fi

