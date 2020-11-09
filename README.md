# Openstack Instance Terraform module
Terraform module for creating Openstack clusters.
[Link](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2) to openstack instance resource.

## TODO:
- Enable block_device
- Enable provisioner "local-exec"

## Usage

```
module "cluster" {
  source = "github.com/Wrede/terraform-os-instance"
  number_of_instances = 5
  name = "test-instance"
  flavor_name = "some-supported-flavor"
  image_name =  "some-supported-flavor"
  os_ssh_keypair = "name-of-ssh-keypair-in-os"
  network_name = "name-of-network-in-os"
  security_groups = ["default"]
  assign_floating_ip = false
}
```

See [master-slaves](https://github.com/Wrede/terraform-os-instance/tree/main/examples/master-slaves) example for using master-slaves [sub-module](https://github.com/Wrede/terraform-os-instance/tree/main/modules/master-slaves)

Use terraform life-cycle:
```
> terraform init
> terraform plan
> terraform apply
```
