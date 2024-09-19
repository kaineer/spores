#!/usr/bin/env bash

install_spore() {
  sudo apt install curl

  KEY_FILE="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
  KEY_URL="https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"
  RELEASE_URL="https://brave-browser-apt-release.s3.brave.com/"

  sudo curl -fsSLo "${KEY_FILE}" "${KEY_URL}"

  echo "deb [signed-by=${KEY_FILE}] ${RELEASE_URL} stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

  sudo apt update

  sudo apt install brave-browser
}

remove_spore() {
  sudo apt remove brave-browser
}

found_spore() {
  [[ "$(locate brave-browser)" != "" ]]
}

BIN=$(readlink -f $0)
DIR=$(dirname $BIN)
source "$DIR/../../bin/main.sh" $1 "Brave browser"
