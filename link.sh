#!/usr/bin/env bash

set -eu

basedir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p ~/.xmonad
ln -s $basedir/xmonad.hs ~/.xmonad/
ln -s $basedir/.xmobarrc ~/
ln -s $basedir/.xprofile ~/
ln -s $basedir/.Xdefaults ~/
ln -s $basedir/.vim ~/
ln -s $basedir/.vimrc ~/
