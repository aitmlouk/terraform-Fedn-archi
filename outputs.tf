output "this_instance_private_ip" {
  description = "The private IP of this instances/instances"
  value       = openstack_compute_instance_v2.this.*.access_ip_v4
}

output "this_instance_id" {
  description = "The ID of this instances/instances"
  value       = openstack_compute_instance_v2.this.*.id
}

output "this_instance_floating_ip" {
  description = "The private IP of this instances/instances"
  value       = openstack_compute_floatingip_v2.this.*.address
}




