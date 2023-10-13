#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
sharedPath="$(pwd)"
sharedFolder="$(basename "${sharedPath}")"
cd "$SCRIPT_DIR"
mkdir "tempFolder"
cd "tempFolder"
zip -r "${sharedFolder}" "${sharedPath}"
ip a | grep -m 1 -A 2 -E "(eth0|wlan0)" | grep inet | awk '{print $2}' | sed 's/\/24//'
python3 -m http.server &&
  rm "${sharedFolder}.zip" &&
  cd .. &&
  rm -d "tempFolder"


