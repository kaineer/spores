#!/usr/bin/env bash

main() {
  CMD="$1"
  NAME="${2:-spore}"

  case "$1" in
    "i"|"install")
      if found_spore ; then
        echo " [INFO ] $NAME is already installed"
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
}

main $1 ${2:-spore}
