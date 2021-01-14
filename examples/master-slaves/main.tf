provider "openstack" {}

module "cluster" {
  source                          = "../../modules/master-slaves"
  number_of_combiners             = 1
  number_of_clients               = 1
  network_name                    = "SNIC 2020/20-13 Internal IPv4 Network"
  security_groups                 = "fedn_groupTerraform"
  flavor_name                     = "ssc.xlarge.highmem"
  image_name                      = "Ubuntu 18.04"
  assign_floating_ip_to_reducer   = true
  assign_floating_ip_to_combiners = true
  assign_floating_ip_to_clients   = true
  floating_ip_pool                = "Public External IPv4 Network"
  image_id                        = "0b7f5fb5-a25c-48b6-8578-06dbfa160723"
  volume_size                     = 300

  ################################## key-pairs parameters 
  public_ssh_keypair              = "./setupFiles/sadi.pub"
  key_name                        = "Sadi_fedn"
  private_ssh_keypair             = "./setupFiles/sadi"
  ################################# configurations Parameters ##################
  same_flavor                     = false
  flavor_name_reducer             = "ssc.xlarge.highmem"
  flavor_name_combiners           = "ssc.xlarge.highcpu"     # "ssc.xlarge.highcpu" (16 cpu 16 ram), "ssc.xlarge" (8 cpu 16 ram)
  flavor_name_clients             = "ssc.xlarge.highmem" 

  name_reducer                    = "Reducer_FEDN_Terraform"
  name_combiners                  = "Combiner_FEDN_Terraform"
  name_clients                    = "Client_FEDN_Terraform"

}


######################## Print out the output variables value 
output "example_module_outputs" {
  value = module.cluster
}