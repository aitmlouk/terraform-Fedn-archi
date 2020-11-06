provider "openstack" {}

module "cluster" {
  source                       = "../../modules/master-slaves"
  number_of_slaves             = 2
  network_name                 = "SNIC 2020/20-13 Internal IPv4 Network"
  security_groups              = ["default"]
  flavor_name                  = "ssc.small"
  image_name                   = "CoreOS - latest"
  assign_floating_ip_to_master = false
  os_ssh_keypair               = "ldsa-teaching"
}