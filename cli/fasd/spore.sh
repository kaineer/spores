#!/usr/bin/env bash

BIN=$(readlink -f $0)
PKG=$(basename $(dirname $BIN))

install_spore() {
  sudo apt -y update
  sudo apt -y install ${PKG}
}

remove_spore() {
  sudo apt -y remove ${PKG}
}

found_spore() {
  [[ "$(which ${PKG})" != "" ]]
}

DIR=$(dirname $BIN)
source "$DIR/../../bin/main.sh" $1 "fasd"
