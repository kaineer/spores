#!/usr/bin/env bash

YTDL_URL=https://github.com/yt-dlp/yt-dlp/releases/download/2023.11.16/yt-dlp_linux
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

case "$1" in
  "i"|"install")
    if found_spore ; then
      echo " [INFO ] Youtube download is already installed"
    else
      install_spore
    fi
    ;;
  "r"|"reinstall")
    remove_spore
    install_spore
    ;;
  "rm"|"remove")
    remove_spore
    ;;
esac

