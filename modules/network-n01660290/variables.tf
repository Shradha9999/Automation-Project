variable "network_rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "network_rg_location" {
  description = "The location/region where the resources are created"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
 default     = "n01660290-VNET"
}

variable "vnet_aspace" {
  description = "Address space of the virtual network"
  type        = list(string)
}

variable "subnet1" {
  description = "Name of the subnet"
  type        = string
 default     = "n01660290-SUBNET"
}

variable "subnet1_aspace" {
  description = "Address prefix for subnet1"
  type        = list(string)
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
  default     = "n01660290-NSG"
}

