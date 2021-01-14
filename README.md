# Openstack Instance Terraform module
Terraform module for creating Openstack clusters.
[Link](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2) to openstack instance resource.

## TODO:
- Enable block_device
- Enable provisioner "local-exec"

## Usage


```
provider "openstack" {}

module "cluster" {
  source                          = "github.com/saadiabadi/terraform-Fedn-archi"
  number_of_combiners             = 1
  number_of_clients               = 1
  network_name                    = "name-of-network-in-os"
  security_groups                 = "security group name"
  flavor_name                     = "some-supported-flavor"
  image_name                      = "some-supported-flavor"
  assign_floating_ip_to_reducer   = true/false 
  assign_floating_ip_to_combiners = true/false 
  assign_floating_ip_to_clients   = true/false 
  floating_ip_pool                = "Name-floating-Ip-pool"
  image_id                        = "some-supported-flavor"
  volume_size                     = integer
  public_ssh_keypair              = "name-of-public-ssh-keypair-path"
  key_name                        = "name-of-ssh-keypair"
  private_ssh_keypair             = "name-of-private-ssh-keypair-path"
  same_flavor                     = false
  flavor_name_reducer             = "some-supported-flavor"
  flavor_name_combiners           = "some-supported-flavor"
  flavor_name_clients             = "some-supported-flavor"
  name_reducer                    = "Reducer_FEDN_Terraform"
  name_combiners                  = "Combiner_FEDN_Terraform"
  name_clients                    = "Client_FEDN_Terraform"

}


######################## Print out the output variables value 
output "example_module_outputs" {
  value = module.cluster
}
```




See [master-slaves](https://github.com/saadiabadi/terraform-Fedn-archi/tree/main/examples/master-slaves) example for using master-slaves [sub-module](https://github.com/saadiabadi/terraform-Fedn-archi/tree/main/modules/master-slaves)

Use terraform life-cycle:
```
> terraform init
> terraform plan
> terraform apply
```
