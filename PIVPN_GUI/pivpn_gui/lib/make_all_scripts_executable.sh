#!/bin/bash

# List of scripts to make executable
scripts=(
  "addUser.sh"
  "disableUser.sh"
  "enableUser.sh"
  "listUsers.sh"
  "removeUser.sh"
  "update.sh"
)

# Loop through each script and make it executable
for script in "${scripts[@]}"; do
  if [ -f "$script" ]; then
    chmod +x "$script"
    echo "Made $script executable."
  else
    echo "File $script does not exist."
  fi
done