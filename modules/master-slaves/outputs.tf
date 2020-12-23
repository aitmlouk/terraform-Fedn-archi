output "reducer_private_ip" {
  value = module.reducer.this_instance_private_ip
}

output "combiners_private_ip" {
  value = module.combiners.this_instance_private_ip
}

output "reducer_floating_ip" {
  value = module.reducer.this_instance_floating_ip
}

output "combiners_floating_ip" {
  value = module.combiners.this_instance_floating_ip
}