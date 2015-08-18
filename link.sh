#!/usr/bin/env bash

set -eu

basedir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p ~/.xmonad
ln -sf $basedir/xmonad.hs ~/.xmonad/
ln -sf $basedir/.xmobarrc ~/
ln -sf $basedir/.xprofile ~/
ln -sf $basedir/.Xdefaults ~/
ln -sfd $basedir/.vim ~/
ln -sf $basedir/.tigrc ~/
ln -sf $basedir/.vimrc ~/
ln -sf $basedir/.zshrc ~/
ln -sf $basedir/.gitconfig ~/
