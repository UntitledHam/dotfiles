# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="murilasso"
#ZSH_THEME="smt"


plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux


# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

cdls () {
  cd "$1" &&
  ls
}

alias ls="ls -A --color=auto"
alias please="sudo"
alias tty-clock="tty-clock -C 6 -c"
