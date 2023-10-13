#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
sharedPath="$(pwd)"
filename="$(basename ${1})"
cd "$SCRIPT_DIR"
mkdir "tempFolder"
cd "tempFolder"
cp "${sharedPath}/${filename} ./"
ip a | grep -m 1 -A 2 -E "(eth0|wlan0)" | grep inet | awk '{print $2}' | sed 's/\/24//'
python3 -m http.server &&
  rm "${filename}" &&
  cd .. &&
  rm -d "tempFolder"


