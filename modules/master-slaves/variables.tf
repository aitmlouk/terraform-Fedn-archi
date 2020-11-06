variable number_of_slaves {
  type        = number
  description = "The number of slaves in the cluster"
  default     = 1
}

variable prefix_name_slaves  {
  type        = string
  description = "Prefix name for the slave instances"
  default     = "Slave"
}

variable name_master {
  type        = string
  description = "The name of the master instance"
  default     = "Master"
}

variable same_flavor {
  type = bool
  description = "Wheather master and slave should have the same favor type. If true flavor_name will be used for all instances"
  default = true
}

variable same_image {
  type = bool
  description = "Wheather master and slave should have the same image. If true image_name will be used for all instances"
  default = true
}

variable flavor_name{
  type        = string
  description = "The flavor to be used for the all (if same_flavor is set to true) instances"
  default     = null
}

variable image_name{
  type        = string
  description = "The image name to be used for the all (if same_image is set to true) instances"
  default     = null
}

variable flavor_name_master {
  type        = string
  description = "The flavor to be used for the master (if same_flavor is set to false) instance"
  default     = null
}

variable image_name_master {
  type        = string
  description = "The image name to be used for the master (if same_image is set to false) instance"
  default     = null
}


variable flavor_name_slaves {
  type        = string
  description = "The flavor to be used for the slave (if same_flavor is set to false) instances"
  default     = null
}

variable image_name_slaves {
  type        = string
  description = "The image name to be used for the slave (if same_image is set to false) instances"
  default     = null
}

variable os_ssh_keypair {
  type        = string
  description = "SSH keypair that already exist in Openstack to inject in the instance"
  default     = ""
}

variable add_os_keypair_to_slaves {
  type = bool
  description = "Wheather to add the OS public key to slaves"
  default = true
}

variable network_name {
  type        = string
  description = "Name of the network to attach"
}

variable security_groups {
  type        = list(string)
  description = "Names of the security groups for instance"
  default     = [""]
}

variable "user_data_master" {
  type        = string
  description = "The user data to provide to the master instance"
  default     = null
}

variable "user_data_slaves" {
  type        = string
  description = "The user data to provide to the slave instances"
  default     = null
}

variable assign_floating_ip_to_master {
  type        = bool
  description = "If true a floating IP will be attached to the master instance"
  default     = true
}

variable assign_floating_ip_to_slaves {
  type        = bool
  description = "If true a floating IP will be attached to the slave instances"
  default     = false
}

variable floating_ip_pool {
  type        = string
  description = "Name of the floating IP pool (don't leave it empty if assign_floating_ip is true)"
  default     = ""
}

variable "num_suffix_format" {
  description = "Numerical suffix format used as the name suffix"
  type        = string
  default     = "-%d"
}
