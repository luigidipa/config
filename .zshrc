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

function print_centered {
     [[ $# == 0 ]] && return 1

     declare -i TERM_COLS="$(tput cols)"
     declare -i str_len="${#1}"
     [[ $str_len -ge $TERM_COLS ]] && {
          echo "$1";
          return 0;
     }

     declare -i filler_len="$(( (TERM_COLS - str_len) / 2 ))"
     [[ $# -ge 2 ]] && ch="${2:0:1}" || ch=" "
     filler=""
     for (( i = 0; i < filler_len; i++ )); do
          filler="${filler}${ch}"
     done

     printf "%s%s%s" "$filler" "$1" "$filler"
     [[ $(( (TERM_COLS - str_len) % 2 )) -ne 0 ]] && printf "%s" "${ch}"
     printf "\n"

     return 0
}

echo ""
echo ""
echo ""
echo ""
echo ""

print_centered "Supera la collinetta!"
