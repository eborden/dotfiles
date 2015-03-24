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
  ag $1 -G ".*\.hs"
}

function _findJS {
  ag $1 -G ".*\.js"
}

function _toO0 {
  find -name "*.cabal" | xargs sed -i "s/O2/O0/g"
  echo "replaced O2 with O0"
}

function _toO2 {
  find -name "*.cabal" | xargs sed -i "s/O0/O2/g"
  echo "replaced O0 with O2"
}

alias findHaskell=_findHaskell
alias findJS=_findJS
alias toO0=_toO0
alias toO2=_toO2
alias v=vim
