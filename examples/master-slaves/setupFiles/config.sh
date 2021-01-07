#!/bin/bash

IFS=":"
while read reducer_details; do

    set $reducer_details
    ##### reducer details
    name_R=$1
    publicIp_R=$2 
    privateIp_R=$3 
    if  echo "$name_R" | grep -q "Reducer"; then

        # echo $name_R
        # echo $publicIp_R
        # echo $privateIp_R


        ### Generate extra_hosts_reducer.yaml file
        {
           printf "version: '3.3'\n"; shift
            printf 'services:\n'; shift
            printf '  reducer:\n'; shift
            printf '    extra_hosts:\n'; shift
            while read combiner_details; do
                set $combiner_details
                ##### combiner details
                name_C=$1
                publicIp_C=$2 
                privateIp_C=$3 
                if echo "$name_C" | grep -q "Combiner"; then
                    echo $combiner_details
                    printf "      %s: %s \n" "$name_C" "$privateIp_C"
                fi
            done 
        } <hosts_Ips1.txt> extra_hosts_reducer.yaml

        ### Generate settings-reducer.yaml file
        {
            printf "network_id: fedn-test-network\n"; shift
            printf 'control:\n'; shift
            printf '  state: idle\n'; shift
            printf '  helper: keras_sequential\n'; shift   #### we have two options keras_sequential or keras_weights
            printf 'statestore:\n'; shift
            printf '  type: MongoDB\n'; shift
            printf '  mongo_config:\n'; shift
            printf '    username: fedn_admin\n'; shift
            printf '    password: password\n'; shift
            printf "    host: $privateIp_R\n"; shift
            printf '    port: 6534\n'; shift
            printf 'storage:\n'; shift
            printf '  storage_type: S3\n'; shift
            printf '  storage_config:\n'; shift
            printf "    storage_hostname: $privateIp_R\n"; shift
            printf '    storage_port: 9000\n'; shift
            printf '    storage_access_key: fedn_admin\n'; shift
            printf '    storage_secret_key: password\n'; shift
            printf '    storage_bucket: fedn-models\n'; shift
            printf '    context_bucket: fedn-context\n'; shift
            printf '    storage_secure_mode: False \n'; shift
            
        } > settings-reducer.yaml
        scp -i sadi extra_hosts_reducer.yaml settings-reducer.yaml ubuntu@${publicIp_R}\:/home/ubuntu/fedn/config

    fi
done < hosts_Ips.txt







# IFS=":"

# while read Folating_ip; do
#     # IPAddresses=($(awk '{print $3}' $Folating_ip))
#     if  echo "$Folating_ip" | grep -q "Reducer"; then
#     publicIp="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$Folating_ip")"
#     echo "$publicIp"
#     # SUBSTRING=$(echo $Folating_ip| cut -d':' -f 1)
#     # echo $SUBSTRING 

#     {
#         printf "version: '3.3'\n"
#         printf 'services:\n'; shift
#         printf '  reducer:\n'; shift
#         printf '    extra_hosts:\n'; shift
#         while read Private_ip; do
#             if  echo "$Private_ip" | grep -q "Combiner"; then
#             # privateIp="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$Private_ip")"
#             # echo "$privateIp"
#             set $Private_ip
#             ####### write the combiner name and its corresponding ips' 
#             printf "      %s: %s \n" "$1" "$2"

#             fi
#         done 
#     } < hosts_Private_Ips.txt> extra_hosts_reducer.yaml
    
#     set $Folating_ip
#     echo $1
#     # ssh -i sadi ubuntu@${publicIp} sudo touch ${1}.txt
#     scp -i sadi extra_hosts_reducer.yaml ubuntu@${publicIp}\:/home/ubuntu/fedn/config

#     fi
# done < hosts_Floating_Ips.txt
