provider "openstack" {}

module "cluster" {
  source                          = "../../modules/master-slaves"
  number_of_combiners             = var.number_of_combiners
  number_of_clients               = var.number_of_clients
  network_name                    = var.network_name
  security_groups                 = var.security_groups
  flavor_name                     = var.flavor_name
  image_name                      = var.image_name
  assign_floating_ip_to_reducer   = var.assign_floating_ip_to_reducer
  assign_floating_ip_to_combiners = var.assign_floating_ip_to_combiners
  assign_floating_ip_to_clients   = var.assign_floating_ip_to_clients
  os_ssh_keypair                  = var.os_ssh_keypair
  floating_ip_pool                = var.floating_ip_pool

  ################################# configurations Parameters ##################
  same_flavor                     = var.same_flavor
  flavor_name_reducer             = var.flavor_name_reducer
  flavor_name_combiners           = var.flavor_name_combiners
  flavor_name_clients             = var.flavor_name_clients

  name_reducer                    = var.name_reducer
  name_combiners                  = var.name_combiners
  name_clients                    = var.name_clients 

}
