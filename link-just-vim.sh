#!/usr/bin/env bash

set -eu

basedir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

ln -sfd $basedir/.vim ~/
ln -sf $basedir/.vimrc ~/
