#!/bin/sh
run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run nitrogen --restore
run speed_keys
run syncthing --no-browser
