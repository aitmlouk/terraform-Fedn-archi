variable number_of_instances {
  type = number
  description = "Number of instances to be created"
  default = 1
}

variable name {
  type        = string
  description = "Prefix for the instance name"
}

variable "use_num_suffix" {
  description = "Always append numerical suffix to instance name, even if count is 1"
  type        = bool
  default     = false
}

variable "num_suffix_format" {
  description = "Numerical suffix format used as the name suffix"
  type        = string
  default     = "-%d"
}

variable flavor_name {
  type        = string
  description = "Flavor to be used for this node"
  default = null
}

variable flavor_id {
  type        = string
  description = "Flavor to be used for this node"
  default = null
}

variable image_name {
  type        = string
  description = "Image name that already exists in Openstack to boot instance from"
  default     = null
}

variable image_id {
  type        = string
  description = "Image ID that already exists in Openstack to boot instance from"
  default     = null
}

variable os_ssh_keypair {
  type        = string
  description = "SSH keypair that already exist in Openstack to inject in the instance"
  default     = ""
}

variable network_name {
  type        = string
  description = "Name of the network to attach"
}

variable security_groups {
  type        = list(string)
  description = "Names of the security groups for instance"
  default     = ["default"]
}

variable user_data {
  type        = string
  description = "The user data to provide when launching the instance"
  default     = null
}

variable assign_floating_ip {
  type        = bool
  description = "If true a floating IP will be attached to this instance"
  default     = false
}

variable floating_ip_pool {
  type        = string
  description = "Name of the floating IP pool (don't leave it empty if assign_floating_ip is true)"
  default     = ""
}