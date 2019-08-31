# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt extendedglob
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install

# source /home/eborden/.zsh/zsh-git-prompt/zshrc.sh

job=$'\e[0;31m仕\e[0m'

PROMPT='%B%m%b$(git_super_status)%(1j.$job.) %# '
