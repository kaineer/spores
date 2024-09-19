#!/usr/bin/env bash

export ZEN_FLAVOUR="generic"

found_spore() {
  [ -f "$HOME/bin/zen" ]
}

install_spore() {
  echo " [INFO ] Installing zen browser"
  mkdir -p "$HOME/tmp/zen"
  cd "$HOME/tmp/zen"
  wget "https://github.com/zen-browser/desktop/releases/download/1.0.1-a.2/zen-$ZEN_FLAVOUR.AppImage"
  mkdir -p "$HOME/bin/appimages"
  cp "zen-$ZEN_FLAVOUR.AppImage" "$HOME/bin/appimages/"
  chmod 755 "$HOME/bin/appimages/zen-$ZEN_FLAVOUR.AppImage"
  cd "$HOME/bin"
  ln -s "./appimages/zen-$ZEN_FLAVOUR.AppImage" ./zen
}

remove_spore() {
  echo " [INFO ] Removing zen browser"
  rm -f "$HOME/bin/zen"
  rm -r "$HOME/bin/appimages/zen-$ZEN_FLAVOUR.AppImage"
}

BIN=$(readlink -f $0)
DIR=$(dirname $BIN)
source "$DIR/../../bin/main.sh" $1 "Zen browser"
