#!/bin/bash
key="sadi"
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

        

while read -r name_R publicIp_R privateIp_R; do

  if  echo "$name_R" | grep -q "Reducer"; then
    echo "Run minio and reducer"
    # ssh-keygen -R $publicIp_R
    # -o StrictHostKeyChecking=no
    new_tab "minio" "ssh -o StrictHostKeyChecking=no -i $key ubuntu@${publicIp_R} 'bash -s' < ./execution_sh/minio.sh"
    sleep 20
    new_tab "reducer" "ssh  -o StrictHostKeyChecking=no -i $key ubuntu@${publicIp_R} 'bash -s' < ./execution_sh/reducer.sh"
      
  fi

done <hosts_Ips.txt