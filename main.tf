resource "openstack_compute_instance_v2" "this" {
  count       = var.number_of_instances
  name        = var.number_of_instances > 1 || var.use_num_suffix ? format("%s${var.num_suffix_format}", var.name, count.index + 1) : var.name
  image_name  = var.image_name
  flavor_name = var.flavor_name
  key_pair    = var.os_ssh_keypair
  user_data    = var.user_data

  network {
    name = var.network_name
  }

  security_groups = var.security_groups

  #TODO: Enable block_device 
  #block_device {}

  #TODO: Enable provisioner, until then use "user_data" or costom image e.g using packer
  #provisioner "local-exec" {}
}

# Allocate floating IPs (if required)
resource "openstack_compute_floatingip_v2" "this" {
  count = var.assign_floating_ip ? var.number_of_instances : 0
  pool  = var.floating_ip_pool
}

# Associate floating IPs (if required)
resource "openstack_compute_floatingip_associate_v2" "this" {
  count       = var.assign_floating_ip ? var.number_of_instances : 0
  floating_ip = element(openstack_compute_floatingip_v2.this.*.address, count.index)
  instance_id = element(openstack_compute_instance_v2.this.*.id, count.index)
}
