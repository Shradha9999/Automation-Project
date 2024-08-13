variable "location" {
  description = "Azure region where resources will be provisioned."
}

variable "resource_group" {
  description = "Name of the resource group where resources will be provisioned."
}

variable "disk_name_prefix" {
  description = "Prefix for the names of the managed disks."
}

variable "data_disk_attr" {
  description = "Attributes for the data disks."
  type        = map
  default = {
    data_disk_type        = "Standard_LRS"
    data_disk_create_option = "Empty"
    data_disk_size        = 10
    data_disk_caching     = "ReadWrite"
  }
}
variable "assignment" {
  description = "Assignment tag value"
  type        = string
  default     = "CCGC 5502 Automation Assignment"
}

variable "name" {
  description = "Name tag value"
  type        = string
  default     = "Aiswarya Surendran"
}

variable "expiration_date" {
  description = "Expiration date tag value"
  type        = string
  default     = "2024-12-31"
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "Learning"
}
variable "vm_ids" {
  type    = list(string)
  description = "List of VM IDs to attach data disks to"
}
