output "master_private_ip" {
  value = module.master.this_instance_private_ip
}

output "slaves_private_ip" {
  value = module.slaves.this_instance_private_ip
}

output "master_floating_ip" {
  value = module.master.this_instance_floating_ip
}

output "slaves_floating_ip" {
  value = module.slaves.this_instance_floating_ip
}