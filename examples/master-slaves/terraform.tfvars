


# This is needed to access the instance over ssh
# security_groups                 = ["default","fedn_group"]
security_groups                 = "fedn_groupSADI"
# securityG_name                  = ["SadiSCG"]
network_name                    ="SNIC 2020/20-13 Internal IPv4 Network"
image_name                      ="Ubuntu 18.04"
image_id                        ="0b7f5fb5-a25c-48b6-8578-06dbfa160723"
floating_ip_pool                ="Public External IPv4 Network"

number_of_combiners             = 2
number_of_clients               = 2

flavor_name                     = "ssc.xlarge.highmem"
same_flavor                     = false
flavor_name_reducer             = "ssc.xlarge.highmem"
flavor_name_combiners           = "ssc.large.highmem"               # "ssc.xlarge.highcpu" (16 cpu 16 ram), "ssc.xlarge" (8 cpu 16 ram)
flavor_name_clients             = "ssc.xlarge.highcpu" 
name_reducer                    = "Reducer_FEDN"
name_combiners                  = "Combiner_FEDN"
name_clients                    = "Client_FEDN"

##### assigning floating IP for each components
assign_floating_ip_to_reducer   = true
assign_floating_ip_to_combiners = true
assign_floating_ip_to_clients   = true
###### Keypair will be used
public_ssh_keypair              = "./setupFiles/sadi.pub"
private_ssh_keypair             = "./setupFiles/sadi"
key_name                        = "Sadi_fedn"
####### Volume size

volume_size                     = 300



