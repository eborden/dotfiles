# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/eborden/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

source /home/eborden/.zsh/zsh-git-prompt/zshrc.sh

PROMPT='%B%m%b$(git_super_status) %# '

function _findHaskell {
  ag $* -G ".*\.hs"
}

function _findJS {
  ag $* -G ".*\.js"
}

#a very unfortunately named alias
function _vag {
  vim $(ag -l $*)
}

function _vext {
  _vag -g ".*\\.$1"
}

alias findHaskell=_findHaskell
alias findJS=_findJS
alias v=vim
alias vag=_vag
alias vile=_vile
