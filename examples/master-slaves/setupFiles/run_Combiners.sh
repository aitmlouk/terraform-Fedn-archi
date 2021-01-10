#!/bin/bash

function new_tab() {
  TAB_NAME=$1
  COMMAND=$2
  osascript \
    -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"printf '\\\e]1;$TAB_NAME\\\a'; $COMMAND\" in front window" \
    -e "end tell" > /dev/null
}

# Let's make a new tab called "My Projects", change to the
# projects directory, and list the contents.

key="sadi"

while read -r name_C publicIp_C privateIp_C; do

  if  echo "$name_C" | grep -q "Combiner"; then
    echo "Run Combiners"
    new_tab "$name_C" "ssh -o StrictHostKeyChecking=no  -i $key ubuntu@${publicIp_C} 'bash -s' < ./execution_sh/combiners.sh"
      
  fi

done <hosts_Ips.txt