#!/usr/bin/env bash

install_spore() {
  sudo apt install curl --yes

  KEY_FILE="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
  KEY_URL="https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"
  RELEASE_URL="https://brave-browser-apt-release.s3.brave.com/"
  LIST_FILE="/etc/apt/sources.list.d/brave-browser-release.list"

  sudo curl -fsSLo "${KEY_FILE}" "${KEY_URL}"

  echo "deb [signed-by=${KEY_FILE}] ${RELEASE_URL} stable main"|sudo tee $LIST_FILE

  sudo apt update --yes

  sudo apt install brave-browser --yes
}

remove_spore() {
  sudo apt remove brave-browser --yes
  sudo rm "$KEY_FILE"
  sudo rm "$LIST_FILE"
}

found_spore() {
  [[ "$(locate brave-browser)" != "" ]]
}

BIN=$(readlink -f $0)
DIR=$(dirname $BIN)
source "$DIR/../../bin/main.sh" $1 "Brave browser"
