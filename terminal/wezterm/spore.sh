#!/usr/bin/env bash

BIN=$(readlink -f $0)
PKG=$(basename $(dirname $BIN))

install_spore() {
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  sudo apt -y update
  sudo apt -y install ${PKG}
}

remove_spore() {
  sudo apt -y remove ${PKG}
  sudo rm /usr/share/keyrings/wezterm-fury.gpg
  sudo rm /etc/apt/sources.list.d/wezterm.list
}

found_spore() {
  [[ "$(which ${PKG})" != "" ]]
}

DIR=$(dirname $BIN)
source "$DIR/../../bin/main.sh" $1 "WezTerm terminal"
