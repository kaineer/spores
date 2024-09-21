#!/usr/bin/env bash

### Config part
SPORE="spore name"

install_spore() {
  ### Describe installing
}

remove_spore() {
  ### Describe uninstalling
}

found_spore() {
  ### Check whether spore is present
}

BIN=$(readlink -f $0)
DIR=$(dirname $BIN)
source "$DIR/../../bin/main.sh" $1 "$SPORE"
