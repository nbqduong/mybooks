#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <extract|encrypt> <password>"
  exit 1
fi

ACTION=$1
PASSWORD=$2

if [ "$ACTION" = "ex" ]; then
  if ! command -v unrar &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y unrar
  fi
  unrar x -p$PASSWORD test.rar
elif [ "$ACTION" = "en" ]; then
  if ! command -v rar &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y rar
  fi
  rm -f test.rar
rar a -hp$PASSWORD test.rar *.md
else
  echo "Invalid action. Please use 'ex' or 'en'."
  exit 1
fi