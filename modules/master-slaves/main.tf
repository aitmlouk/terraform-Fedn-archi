module "reducer" {
  source = "../../"
  number_of_instances = 1
  name = var.name_reducer
  flavor_name = var.same_flavor ? var.flavor_name : var.flavor_name_reducer
  image_name =  var.same_image ? var.image_name : var.image_name_reducer 
  os_ssh_keypair = var.os_ssh_keypair
  network_name = var.network_name
  security_groups = var.security_groups
  user_data = var.user_data_reducer
  assign_floating_ip = var.assign_floating_ip_to_reducer 
  floating_ip_pool = var.floating_ip_pool
}

module "combiners" {
  source = "../../"
  number_of_instances = var.number_of_combiners
  name = var.name_combiners
  flavor_name = var.same_flavor ? var.flavor_name : var.flavor_name_combiners
  image_name =  var.same_image ? var.image_name : var.image_name_combiners
  os_ssh_keypair = var.os_ssh_keypair #var.add_os_keypair_to_combiners ? var.os_ssh_keypair: null
  network_name = var.network_name
  security_groups = var.security_groups
  user_data = var.user_data_combiners
  assign_floating_ip = var.assign_floating_ip_to_combiners
  floating_ip_pool = var.floating_ip_pool
}

module "clients" {
  source = "../../"
  number_of_instances = var.number_of_clients
  name = var.name_clients
  flavor_name = var.same_flavor ? var.flavor_name : var.flavor_name_clients
  image_name =  var.same_image ? var.image_name : var.image_name_clients
  os_ssh_keypair = var.os_ssh_keypair #var.add_os_keypair_to_clients ? var.os_ssh_keypair: null
  network_name = var.network_name
  security_groups = var.security_groups
  user_data = var.user_data_clients
  assign_floating_ip = var.assign_floating_ip_to_clients
  floating_ip_pool = var.floating_ip_pool
}