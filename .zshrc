# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux


# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
source ~/env_vars

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
alias hx="helix"
alias mk="musikcube"
alias sober="flatpak run org.vinegarhq.Sober"
alias update-river="$HOME/.config/river/init"

export PATH=$PATH:~/.cargo/bin/

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust 

### End of Zinit's installer chunk


zi snippet OMZL::clipboard.zsh
zi snippet OMZL::termsupport.zsh
zi snippet OMZL::git.zsh
zi snippet OMZL::theme-and-appearance.zsh 
zi snippet OMZL::prompt_info_functions.zsh
zi snippet OMZL::async_prompt.zsh
zi snippet OMZL::functions.zsh
zi snippet OMZL::misc.zsh
zi snippet OMZL::vcs_info.zsh



zi snippet OMZP::git
zi snippet OMZP::ruby
zi snippet OMZP::conda-env
zi snippet OMZP::sudo





zi cdclear -q # <- forget completions provided up to this moment

# Prompt
setopt promptsubst
zinit snippet OMZT::murilasso


