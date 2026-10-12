autoload -Uz compinit
if [[ -n $(find "${ZDOTDIR:-$HOME}/.zcompdump" -mtime +1 2>/dev/null) ]]; then
  compinit
else
  compinit -C
fi

# go
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/Users/luigidp/.local/bin" # pipx
# custom scripts
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/bin/cpd-cli-arm64-EE-14.3.1-3056"

# Aliases
alias h="history"
alias c="clear"
alias e="exit"
alias py="python3"
alias nv="nvim"
alias lzg="lazygit"
alias lzd="sudo lazydocker"
alias kc="kubectl"
alias orc="orchestrate"

alias tn="tmux new -s"
alias ta="tmux attach -t"
alias td="tmux detach"
alias tls="tmux ls"

alias detect-secrets="detect-secrets scan --update .secrets.baseline && detect-secrets audit .secrets.baseline"

function ocl() {
  oc login "https://api.${1}.cp.fyre.ibm.com:6443" -u kubeadmin -p "${2}" --insecure-skip-tls-verify
}

# Initialize starship
eval "$(starship init zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --no-rehash -)"
eval "$(pyenv virtualenv-init -)"

# Lazy-load NVM
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  unset -f nvm node npm npx pnpm yarn
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { load_nvm; nvm "$@"; }
node() { load_nvm; node "$@"; }
npm() { load_nvm; npm "$@"; }
npx() { load_nvm; npx "$@"; }
pnpm() { load_nvm; pnpm "$@"; }
yarn() { load_nvm; yarn "$@"; }

# Lazy-load kubectl & oc completions
if [ $commands[kubectl] ]; then
  _kubectl_completion_lazy() {
    source <(kubectl completion zsh)
    _kubectl "$@"
  }
  compdef _kubectl_completion_lazy kubectl
fi

if [ $commands[oc] ]; then
  _oc_completion_lazy() {
    source <(oc completion zsh)
    _oc "$@"
  }
  compdef _oc_completion_lazy oc
fi
