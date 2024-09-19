#!/usr/bin/env bash

RELEASE="2024.08.06"
REPO="https://github.com/yt-dlp/yt-dlp"
YTDL_URL="$REPO/releases/download/$RELEASE/yt-dlp_linux"
YTDL_BIN=youtube-dl
YTDL_PATH="$HOME/bin/releases/$YTDL_BIN"

install_spore() {
  mkdir -p "$HOME/bin/releases"
  curl -L "$YTDL_URL" -o "$YTDL_PATH"
  chmod 755 "$YTDL_PATH"
  cd "$HOME/bin"
  ln -s "$YTDL_PATH" ./ytdl
}

found_spore() {
  [ -f "$HOME/bin/ytdl" ]
}

remove_spore() {
  rm -f "$YTDL_PATH"
  rm -f "$HOME/bin/ytdl"
}

BIN=$(readlink -f $0)
DIR=$(dirname $BIN)
source "$DIR/../../bin/main.sh" $1 "Youtube download"
