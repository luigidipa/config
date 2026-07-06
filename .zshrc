autoload -Uz compinit

compinit
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

# alias cpd-cli="~/bin/cpd-cli-arm64-EE-14.3.1-3056/cpd-cli"

# Initialize starship
eval "$(starship init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Commented out because it slows down startup
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source <(kubectl completion zsh)

if [ $commands[oc] ]; then
  source <(oc completion zsh)
  compdef _oc oc
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
