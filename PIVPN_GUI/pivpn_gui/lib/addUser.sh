#!/bin/bash

# Check if a parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <parameter>"
  exit 1
fi

# Use the parameter
param=$1
#echo "The provided parameter is: $param"
echo ---- | sudo -S pivpn -a -n $param

gnome-terminal -- bash -c "echo $param | sudo -S pivpn -qr; exec bash"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Command executed successfully."
else
  echo "Command failed."
  exit 1
fi
