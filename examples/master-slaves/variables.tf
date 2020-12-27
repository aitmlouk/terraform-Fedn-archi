
variable same_flavor {
  type = bool
  description = "Wheather reducer and combiner should have the same favor type. If true flavor_name will be used for all instances"
  default = false
}

variable same_image {
  type = bool
  description = "Wheather reducer and combiner should have the same image. If true image_name will be used for all instances"
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


# variable os_ssh_keypair {
#   type        = string
#   description = "SSH keypair that already exist in Openstack to inject in the instance"
#   default     = ""
# }


variable network_name {
  type        = string
  description = "Name of the network to attach"
}

variable security_groups {
  type        = list(string)
  description = "Names of the security groups for instance"
  default     = [""]
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


########################################################################################################################
#  Reducer

variable name_reducer {
  type        = string
  description = "The name of the reducer instance"
  default     = ""
}


variable flavor_name_reducer {
  type        = string
  description = "The flavor to be used for the reducer (if same_flavor is set to false) instance"
  default     = ""
}

variable image_name_reducer {
  type        = string
  description = "The image name to be used for the reducer (if same_image is set to false) instance"
  default     = null
}


variable assign_floating_ip_to_reducer {
  type        = bool
  description = "If true a floating IP will be attached to the reducer instance"
  default     = false
}


variable "user_data_reducer" {
  type        = string
  description = "The user data to provide to the reducer instance"
  default     = null
}



########################################################################################################################
#  Combiner

variable number_of_combiners {
  type        = number
  description = "The number of combiners in the cluster"
  default     = 1
}

variable name_combiners  {
  type        = string
  description = "Prefix name for the combiner instances"
  default     = ""
}


variable flavor_name_combiners {
  type        = string
  description = "The flavor to be used for the combiner (if same_flavor is set to false) instances"
  default     = ""
}

variable image_name_combiners {
  type        = string
  description = "The image name to be used for the combiner (if same_image is set to false) instances"
  default     = null
}


variable add_os_keypair_to_combiners {
  type = bool
  description = "Wheather to add the OS public key to combiners"
  default = true
}


variable "user_data_combiners" {
  type        = string
  description = "The user data to provide to the combiner instances"
  default     = null
}

variable assign_floating_ip_to_combiners {
  type        = bool
  description = "If true a floating IP will be attached to the combiner instances"
  default     = false
}


########################################################################################################################
#  Clients

variable number_of_clients {
  type        = number
  description = "The number of client in the cluster"
  default     = 1
}

variable flavor_name_clients {
  type        = string
  description = "The flavor to be used for the client (if same_flavor is set to false) instances"
  default     = ""
}

variable image_name_clients {
  type        = string
  description = "The image name to be used for the client (if same_image is set to false) instances"
  default     = null
}


variable add_os_keypair_to_clients {
  type = bool
  description = "Wheather to add the OS public key to client"
  default = true
}


variable "user_data_clients" {
  type        = string
  description = "The user data to provide to the client instances"
  default     = null
}


variable assign_floating_ip_to_clients {
  type        = bool
  description = "If true a floating IP will be attached to the client instances"
  default     = false
}

variable name_clients  {
  type        = string
  description = "Prefix name for the combiner instances"
  default     = ""
}


#############################################################
########      key-pairs

variable key_name {
  type        = "string"
  description = "KeyPair name to create"
}

variable public_ssh_keypair {
  type        = string
  description = "SSH keypair that already exist in Openstack to inject in the instance"
  default     = ""
}

variable private_ssh_keypair {
  type        = string
  description = "SSH keypair that already exist in Openstack to inject in the instance"
  default     = ""
}
