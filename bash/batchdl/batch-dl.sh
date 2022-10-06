#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
LISTNAME=${1}

[ -z "${LISTNAME}" ] && 
  echo "error! you need atleast 1 args" && 
  echo "usage: ./batch-dl.sh <listfile>" &&
  exit

cd "${SCRIPT_DIR}"
cd "./downloaded/"
for URL in $(cat "../${LISTNAME}" | sed -e "/^\s*$/d"); do
  echo "downloading: ${URL}"
  youtube-dl "${URL}" -o "%(uploader)s-%(id)s.%(ext)s"
done
