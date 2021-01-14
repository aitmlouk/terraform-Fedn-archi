resource "openstack_compute_instance_v2" "this" {
  count           = var.number_of_instances
  name            = var.number_of_instances > 1 || var.use_num_suffix ? format("%s${var.num_suffix_format}", var.name, count.index + 1) : var.name
  # image_name      = var.image_name
  image_id        = var.image_id
  flavor_name     = var.flavor_name
  key_pair        = var.key_name
  user_data       = var.user_data
  security_groups = [var.security_groups]
  
  network {
    name = var.network_name
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo > ./setupFiles/hosts_Ips.txt"
  }

  ### Attach volume
 block_device {
    uuid                  = var.image_id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    volume_size           = var.volume_size
    delete_on_termination = true
  }
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
  count       = var.number_of_instances
  depends_on = ["openstack_compute_floatingip_associate_v2.this"]
  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("${var.private_ssh_keypair}")}" #file(var.os_ssh_keypair)
      host        =  element(openstack_compute_floatingip_associate_v2.this.*.floating_ip, count.index)
    }

  provisioner "file" {
      source      = "./setupFiles/setup.sh" #"${abspath(path.root)}/setupFiles/setup.sh"
      destination = "/home/ubuntu/setup.sh"
    }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu/",
      "sudo chmod 0777 setup.sh",
      "sudo ./setup.sh",
    ]
    }


############ Export all instances public and private IPs' 
  provisioner "local-exec" {
      command = "echo ${element(openstack_compute_instance_v2.this.*.name,count.index)} ${element(openstack_compute_floatingip_associate_v2.this.*.floating_ip, count.index)} ${element(openstack_compute_instance_v2.this.*.access_ip_v4, count.index)} >> ./setupFiles/hosts_Ips.txt" 
    }

 
}
