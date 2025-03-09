#!/bin/bash

source ./password.sh

# Check if a parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <parameter>"
  exit 1
fi

# Use the parameter
param=$1
echo y | sudo -S pivpn -off $param

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Command executed successfully."
else
  echo "Command failed."
  exit 1
fi