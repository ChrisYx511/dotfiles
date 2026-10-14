eval "$(starship init zsh)"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
uname -a
# export PATH=$HOME/flutter/bin:$PATH
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=130"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/chrisyx511/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/chrisyx511/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/chrisyx511/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/chrisyx511/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

export GPG_TTY=$(tty)

alias reels="open https://www.instagram.com/reels/"
alias gt="git-spice"

# . "$HOME/.local/bin/env"
# . "/Users/chrisyx511/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(~/.local/bin/mise activate zsh)"
export AWS_PROFILE=shared-services-dev
alias asl='aws sso login --profile "$AWS_PROFILE"'
alias gcl='gcloud auth application-default login'
alias ag='asl && gcl'

alias acd='cd ~/Documents/Code/abbott-r2d2/'

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/chrisyang/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions

# Source custom functions
for function_file in ~/.zsh/functions/*.zsh; do
  source $function_file
done

export GITHUB_TOKEN=$(gh auth token 2>/dev/null)
