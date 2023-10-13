#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR"
echo "${1}" > index.html
ip a | grep -m 1 -A 2 -E "(eth0|wlan0)" | grep inet | awk '{print $2}' | sed 's/\/24//'
python3 -m http.server &&
  rm index.html
