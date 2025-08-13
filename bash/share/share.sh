#!/bin/bash

SHARE_DIR="${HOME}/coding/share/"
SHARE_NAME="share"
SHARE_TYPE=""
SHARE_IP=$(hostname -I | awk '{print $1}')

# move to the ~/coding/share directory
cd "$SHARE_DIR" || { echo "Directory $SHARE_DIR does not exist."; exit 1; }

# check if $1 $2 is filled
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 {text|file|dir} <content|path>"
  exit 1
fi

# check if the first argument is a file
if [ $1 == "text" ]; then
  text="$2"
  SHARE_NAME="text.txt"
  SHARE_TYPE="text"
  echo "$text" > "$SHARE_NAME"
elif [ $1 == "file" ]; then
  file="$2"
  SHARE_NAME=$(basename "$file")
  SHARE_TYPE="file"
  if [ -f "$file" ]; then
    cp "$file" "$SHARE_NAME"
  else
    echo "File $file does not exist."
    exit 1
  fi
elif [ $1 == "dir" ]; then
  dir="$2"
  SHARE_NAME=$(basename "$dir")
  SHARE_TYPE="dir"
  if [ -d "$dir" ]; then
    cp -r "$dir" "$SHARE_NAME"
  else
    echo "Directory $dir does not exist."
    exit 1
  fi
else
  echo "Usage: $0 {text|file|dir} <content|path>"
  exit 1
fi

# catch the exit signal to stop the server
# then check if the file is a text file, a file, or a directory, then delete it safely!!!
# then actually exit the script
remove_safely() {
  if [ "$SHARE_TYPE" == "text" ]; then
    rm -f "$SHARE_NAME"
    echo "Removed text file $SHARE_NAME safely."
  elif [ "$SHARE_TYPE" == "file" ]; then
    rm -f "$SHARE_NAME"
    echo "Removed file $SHARE_NAME safely."
  elif [ "$SHARE_TYPE" == "dir" ]; then
    rm -rf "$SHARE_NAME"
    echo "Removed directory $SHARE_NAME safely."
  else
    echo "No valid share type to remove."
  fi
}
trap remove_safely SIGINT SIGTERM

# print out
echo "$SHARE_TYPE is shared at http://$SHARE_IP:8000/$SHARE_NAME"

# start a simple HTTP server to share the file
python3 -m http.server 8000
