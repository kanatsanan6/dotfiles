eval "$(/opt/homebrew/bin/brew shellenv)"

. ~/.zsh/aliases
. ~/.zsh/configs
. ~/.zsh/functions

bindkey -s ^f "~/scripts/tmux-sessionizer\n"

export ZK_NOTEBOOK_DIR='/Users/kanatsananj/notes'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# export PATH="/opt/homebrew/opt/llvm@15/bin:$PATH"

eval "$(zoxide init --cmd cd zsh)"
