#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
sharedFolder="$(pwd)"
cd "$SCRIPT_DIR"
ln -s "${sharedFolder}" "tempFolder"
cd "tempFolder"
ip a | grep -m 1 -A 2 -E "(eth0|wlan0)" | grep inet | awk '{print $2}' | sed 's/\/24//'
python3 -m http.server &&
  cd ..&&
  rm tempFolder
