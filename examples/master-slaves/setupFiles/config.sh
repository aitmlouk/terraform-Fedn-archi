#!/bin/bash

maxclients=50
while read -r name_R publicIp_R privateIp_R; do
    ##### reducer details
    
    if  echo "$name_R" | grep -q "Reducer"; then
        echo "Generate extra-hosts-reducer.yaml file"
        mkdir ./configs/$name_R/

        ### Generate extra_hosts_reducer.yaml file
        {
            printf "version: '3.3'\n"; shift
            printf 'services:\n'; shift
            printf '  reducer:\n'; shift
            printf '    extra_hosts:\n'; shift

            while read -r name_C publicIp_C privateIp_C; do
                # set $combiner_details
                ##### combiner details
                if echo "$name_C" | grep -q "Combiner"; then
                    printf '      %s: %s \n' "$name_C" "$privateIp_C"
                fi
            done 
        } <hosts_Ips.txt >./configs/$name_R/extra-hosts-reducer.yaml

        echo "Generate settings-reducer.yaml file"

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
            
        } >./configs/$name_R/settings-reducer.yaml

        ## Move the reducer configuration files to the reducer instance
        echo "Move both settings-reducer.yaml and  extra-hosts-reducer.yaml files to the reducer instance"
        scp -i sadi ./configs/$name_R/extra-hosts-reducer.yaml ./configs/$name_R/settings-reducer.yaml ubuntu@${publicIp_R}\:/home/ubuntu/fedn/config


        
       

        ### Generate settings-combiner.yaml file
        
            while read -r name_C publicIp_C privateIp_C; do
                # set $combiner_details
                ##### combiner details
                if echo "$name_C" | grep -q "Combiner"; then
                    mkdir ./configs/$name_C/
                    echo "Generate settings-combiner.yaml file ($name_C)"
                    {
                        printf "network_id: fedn-test-networ\n"; shift
                        printf "controller:\n"; shift
                        printf "    discover_host: $privateIp_R\n"; shift
                        printf "    discover_port: 8090\n"; shift
                        printf "    token: token \n \n"; shift
                        printf "combiner:\n"; shift
                        printf "    name: $name_C\n"; shift
                        printf "    host: $name_C\n"; shift
                        printf "    port: 12080\n"; shift
                        printf "    max_clients: $maxclients\n"; shift
                    } >./configs/$name_C/settings-combiner.yaml

                    echo "Move settings-combiner.yaml file to the combiner instance"
                    scp -i sadi ./configs/$name_C/settings-combiner.yaml  ubuntu@${publicIp_C}\:/home/ubuntu/fedn/config
                fi
            done <hosts_Ips.txt

        

        ### Generate settings-client.yaml file
        
            while read -r name_Client publicIp_Client privateIp_Client; do
                # set $combiner_details
                ##### combiner details
                if echo "$name_Client" | grep -q "Client"; then
                    mkdir ./configs/$name_Client/
                    echo "Generate settings-client.yaml file ($name_Client)"
                    {
                        printf "network_id: fedn-test-networ\n"; shift
                        printf "controller:\n"; shift
                        printf "    discover_host: $privateIp_R\n"; shift
                        printf "    discover_port: 8090\n"; shift
                        printf "    token: token \n \n"; shift
                    } >./configs/$name_Client/settings-client.yaml



                    ### Generate extra-hosts-client.yaml file
                    echo "Generate extra-hosts-client.yaml file"
                    {
                        printf "version: '3.3'\n"; shift
                        printf 'services:\n'; shift
                        printf '   client:\n'; shift
                        printf '    extra_hosts:\n'; shift

                        while read -r name_C publicIp_C privateIp_C; do                
                            ##### combiner details
                            if echo "$name_C" | grep -q "Combiner"; then
                                printf '      %s: %s \n' "$name_C" "$privateIp_C"
                            fi
                        done 
                    } <hosts_Ips.txt >./configs/$name_Client/extra-hosts-client.yaml



                    echo "Move settings-client.yaml file to the client instance"
                    scp -i sadi ./configs/$name_Client/settings-client.yaml ./configs/$name_Client/extra-hosts-client.yaml ubuntu@${publicIp_Client}\:/home/ubuntu/fedn/config
                fi
            done <hosts_Ips.txt



    fi
done <hosts_Ips.txt
