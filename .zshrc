# bun completions
[ -s "/home/luigidp/.bun/_bun" ] && source "/home/luigidp/.bun/_bun"

# Autocompletion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/go/bin"

# custom scripts
export PATH="$PATH:$HOME/bin"

# Aliases
alias h="history"
alias c="clear"
alias e="exit"
alias py="python3"
alias nv="nvim"
alias lzg="lazygit"
alias lzd="sudo lazydocker"

alias tn="tmux new -s"
alias ta="tmux attach -t"
alias td="tmux detach"
alias tls="tmux ls"

# Initialize starship
eval "$(starship init zsh)"
