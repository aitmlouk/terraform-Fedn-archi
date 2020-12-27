# resource "openstack_compute_instance_v2" "this" {
#   count       = var.number_of_instances
#   name        = var.number_of_instances > 1 || var.use_num_suffix ? format("%s${var.num_suffix_format}", var.name, count.index + 1) : var.name
#   image_name  = var.image_name
#   flavor_name = var.flavor_name
#   key_pair    = var.os_ssh_keypair
#   user_data    = var.user_data

#   network {
#     name = var.network_name
#   }

#   security_groups = var.security_groups

#   #TODO: Enable block_device 
#   #block_device {}

#   #TODO: Enable provisioner, until then use "user_data" or costom image e.g using packer
#   #provisioner "local-exec" {}
# }

# # Allocate floating IPs (if required)
# resource "openstack_compute_floatingip_v2" "this" {
#   count = var.assign_floating_ip ? var.number_of_instances : 0
#   pool  = var.floating_ip_pool
# }

# # Associate floating IPs (if required)
# resource "openstack_compute_floatingip_associate_v2" "this" {
#   count       = var.assign_floating_ip ? var.number_of_instances : 0
#   floating_ip = element(openstack_compute_floatingip_v2.this.*.address, count.index)
#   instance_id = element(openstack_compute_instance_v2.this.*.id, count.index)
# }


# resource "openstack_compute_keypair_v2" "keypair" {              
#   name       = "keypair"                 
#   # public_key = file(var.os_ssh_keypair)
#   public_key = file("${var.os_ssh_keypair}.pub")

#   }


resource "openstack_compute_instance_v2" "this" {
  count       = var.number_of_instances
  name        = var.number_of_instances > 1 || var.use_num_suffix ? format("%s${var.num_suffix_format}", var.name, count.index + 1) : var.name
  image_name  = var.image_name
  flavor_name = var.flavor_name
  key_pair    = var.key_name
  # key_pair    = var.os_ssh_keypair
  user_data    = var.user_data

  network {
    name = var.network_name
  }

  security_groups = var.security_groups

  # provisioner "file" {
  #   source      = "./setupFiles/setup.sh"
  #   destination = "/tmp/setup.sh"

  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu"
  #     private_key = "${file("${var.private_ssh_keypair}")}" #file(var.os_ssh_keypair)
  #     host        = "${openstack_compute_floatingip_v2.this.*.address}"
  #   }
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/setup.sh",
  #     "/tmp/setup.sh",
  #   ]
  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu"
  #     private_key = "${file("${var.private_ssh_keypair}")}" #file(var.os_ssh_keypair)
  #     host        = "${openstack_compute_floatingip_v2.this.*.address}"
  #   }
  # }
  # #provisioner "local-exec" {
  # #  command = "ssh-keygen -b 2048 -t rsa -f deploy.key -q -N ''"
  # #}
  # provisioner "local-exec" {
  #   command = "echo COMMON=${openstack_compute_floatingip_v2.this.*.address} > common_ip.txt" #TODO push file to other hosts for connecting
  # }

  }


# Allocate floating IPs (if required)
resource "openstack_compute_floatingip_v2" "this" {
  count = var.assign_floating_ip ? var.number_of_instances : 0
  pool  =  var.floating_ip_pool
}

# Associate floating IPs (if required)
resource "openstack_compute_floatingip_associate_v2" "this" {
  count       = var.assign_floating_ip ? var.number_of_instances : 0
  floating_ip = element(openstack_compute_floatingip_v2.this.*.address, count.index)
  instance_id = element(openstack_compute_instance_v2.this.*.id, count.index)
}


resource "null_resource" "provision" {
  depends_on = ["openstack_compute_floatingip_associate_v2.this"]
  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("${var.private_ssh_keypair}")}" #file(var.os_ssh_keypair)
      host        = element(openstack_compute_floatingip_associate_v2.this.*.floating_ip, 0)
    }

  provisioner "file" {
      source      = "${abspath(path.root)}/setupFiles/setup.sh"
      destination = "/home/ubuntu/setup.sh"
    }

    provisioner "remote-exec" {
      inline = [
        "cd /home/ubuntu/",
        "sudo chmod 0777 setup.sh",
        "./setup.sh"
      ]
    }
  #provisioner "local-exec" {
  #  command = "ssh-keygen -b 2048 -t rsa -f deploy.key -q -N ''"
  #}
  provisioner "local-exec" {
    command = "echo COMMON=${openstack_compute_floatingip_associate_v2.this.*.floating_ip} > common_ip.txt" #TODO push file to other hosts for connecting
    # command = "echo COMMON=${element(openstack_compute_floatingip_associate_v2.this.*.floating_ip, 0)} > common_ip1.txt" 
  }

}
