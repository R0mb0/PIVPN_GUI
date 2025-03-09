#!/bin/bash

source ./password.sh

echo $PASSWORD | sudo -S pivpn -up

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Command executed successfully."
else
  echo "Command failed."
  exit 1
fi