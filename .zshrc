export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,tmp/*}"'

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(rbenv init -)"


alias project="~/scripts/manage_projects.sh"

alias lgb='git lgb'

alias vi=nvim

alias mg='rails db:migrate'
alias mgs='rails db:migrate:status'
alias rb='rails db:rollback'
alias b='bundle'
alias be='bundle exec'
alias tpp='rails db:test:prepare'
alias rc='rails c'
alias rs='rails s'
alias r='rails'

alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

export EDITOR=nvim

function work() {
  # usage: work 10m, work 60s etc. Default is 25m
  timer "${1:-90m}" && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -sound Crystal
}

function rest() {
  # usage: rest 10m, rest 60s etc. Default is 5m
  timer "${1:-10m}" && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -sound Crystal
}

function pr() {
  gh pr list \
    | fzf \
    --delimiter "\t" \
    --reverse \
    --preview="GH_FORCE_TTY=true CICOLOR_FORCE=1 gh pr view {1}" \
    --bind="enter:become(gh pr view -w {1}),ctrl-e:become(gh pr checkout {1})"
}

function ctx {
  kubectl config get-contexts
}

# pods() {
#   FZF_DEFAULT_COMMAND="kubectl get pods --all-namespaces" \
#     fzf --info=inline --layout=reverse --header-lines=1 --border \
#     --prompt "$(kubectl config current-context | sed 's/-context$//')> " \
#     --header $'╱ Enter (kubectl exec) ╱ CTRL-O (open log in editor) ╱ CTRL-R (reload) ╱\n\n' \
#     --bind ctrl-/:toggle-preview \
#     --bind 'enter:execute:kubectl exec -it --namespace {1} {2} -- bash > /dev/tty' \
#     --bind 'ctrl-o:execute:${EDITOR:-vim} <(kubectl logs --namespace {1} {2}) > /dev/tty' \
#     --bind 'ctrl-r:reload:eval "$FZF_DEFAULT_COMMAND"' \
#     --preview-window up:follow \
#     --preview 'kubectl logs --follow --tail=100000 --namespace {1} {2}' "$@"
# }

pods() {
  local original_bg_color=$(tput setab 0)  # Save original background color
  tput setab 4  # Set background color to navy blue (ANSI color code 4)

  FZF_DEFAULT_COMMAND="kubectl get pods --all-namespaces" \
    fzf --layout=reverse \
    --prompt "$(kubectl config current-context | sed 's/-context$//')> " \
    --bind ctrl-/:toggle-preview \
    --bind 'enter:execute:{ tput setab 0; kubectl exec -it --namespace {1} {2} -- bash > /dev/tty; tput setab 4; }' \
    --bind 'ctrl-o:execute:${EDITOR:-vim} <(kubectl logs --namespace {1} {2}) > /dev/tty' \
    --bind 'ctrl-r:reload:eval "$FZF_DEFAULT_COMMAND"'

  tput setab 0  # Reset background color to original
}


contexts() {
  selected_context=$(kubectl config get-contexts -o name | fzf --layout=reverse \
    --prompt "Select context> ")

  if [ -n "$selected_context" ]; then
    kubectl config use-context $selected_context
  fi
}

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# COLOR_DEF=$'\e[0m'
# COLOR_DIR=$'\e[38;5;197m'
# COLOR_GIT=$'\e[38;5;39m'
# setopt PROMPT_SUBST
export PROMPT='%~ $(parse_git_branch) $ '

gbb() {
  local branch
  branch=$(git branch --all | sed 's/remotes\///' | grep -v HEAD | fzf)

  if [[ -n "$branch" ]]; then
    # Trim the leading "* " if it exists
    branch=${branch#\* }
    # Switch to the selected branch
    git checkout "$branch"
  fi
}

function bs() {
  git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
alias datawow='cd Documents/datawowio'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

eval "$(zoxide init --cmd cd zsh)"
