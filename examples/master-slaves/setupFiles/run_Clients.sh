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

while read -r name_Client publicIp_Client privateIp_Client; do

  if  echo "$name_Client" | grep -q "Client"; then
    sleep 5
    echo "Run Clients"
    scp -i $key casa.zip ubuntu@${publicIp_Client}\:/home/ubuntu/fedn/test
    new_tab "$name_Client" "ssh -o StrictHostKeyChecking=no  -i $key ubuntu@${publicIp_Client} 'bash -s' < ./execution_sh/clients.sh"
    
      
  fi

done <hosts_Ips.txt