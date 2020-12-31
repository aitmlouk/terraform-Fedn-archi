resource "openstack_networking_secgroup_v2" "terraform" {
  name        = var.securityG_name
  description = "Security group for the Terraform example instances"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_22" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_80" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_443" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_3546" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3546
  port_range_max    = 3546
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}


resource "openstack_networking_secgroup_rule_v2" "terraform_5111" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5111
  port_range_max    = 5111
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_6534" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6534
  port_range_max    = 6534
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_8081" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8081
  port_range_max    = 8081
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}


resource "openstack_networking_secgroup_rule_v2" "terraform_8090" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8090
  port_range_max    = 8090
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_9000" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9000
  port_range_max    = 9000
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_12080" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 12080
  port_range_max    = 12080
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_12081" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 12081
  port_range_max    = 12081
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}


resource "openstack_networking_secgroup_rule_v2" "terraform_12082" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 12082
  port_range_max    = 12082
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_12083" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 12083
  port_range_max    = 12083
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}

resource "openstack_networking_secgroup_rule_v2" "terraform_27017" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 27017
  port_range_max    = 27017
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
}
######################### Egress

#### already exist for this otherwise should be enabled
# resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_egress_v4" {
#   direction         = "egress"
#   ethertype         = "IPv4"
#   security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
# }

# resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_egress_v6" {
#   direction         = "egress"
#   ethertype         = "IPv6"
#   security_group_id = "${openstack_networking_secgroup_v2.terraform.id}"
# }