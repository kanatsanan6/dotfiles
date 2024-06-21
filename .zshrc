eval "$(/opt/homebrew/bin/brew shellenv)"

. ~/.zsh/aliases
. ~/.zsh/configs
. ~/.zsh/functions

bindkey -s ^f "~/scripts/tmux-sessionizer\n"

export ZK_NOTEBOOK_DIR='/Users/kanatsananj/notes'
export TEMPL_EXPERIMENT=rawgo

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# export PATH="/opt/homebrew/opt/llvm@15/bin:$PATH"

 export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(zoxide init --cmd cd zsh)"
