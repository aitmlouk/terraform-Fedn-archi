module "master" {
  source = "../../"
  number_of_instances = 1
  name = var.name_master
  flavor_name = var.same_flavor ? var.flavor_name : var.flavor_name_master
  image_name =  var.same_image ? var.image_name : var.image_name_master
  os_ssh_keypair = var.os_ssh_keypair
  network_name = var.network_name
  security_groups = var.security_groups
  user_data = var.user_data_master
  assign_floating_ip = var.assign_floating_ip_to_master
  floating_ip_pool = var.floating_ip_pool
}

module "slaves" {
  source = "../../"
  number_of_instances = var.number_of_slaves
  name = var.prefix_name_slaves
  flavor_name = var.same_flavor ? var.flavor_name : var.flavor_name_slaves
  image_name =  var.same_image ? var.image_name : var.image_name_slaves
  os_ssh_keypair = var.add_os_keypair_to_slaves ? var.os_ssh_keypair: null
  network_name = var.network_name
  security_groups = var.security_groups
  user_data = var.user_data_slaves
  assign_floating_ip = var.assign_floating_ip_to_slaves
  floating_ip_pool = var.floating_ip_pool
}