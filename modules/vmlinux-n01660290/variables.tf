variable "linux_rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "linux_rg_location" {
  description = "The location/region where the resources are created"
  type        = string
}

variable "subnet1_id" {
  description = "ID of subnet1"
  type        = string
}

variable "size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "n01660290"
}

variable "public_key_path" {
  description = "Path to the public key file for SSH authentication"
  type        = string
  default     = "/home/N01660290/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to the private key file for SSH authentication"
  type        = string
  default     = "/home/N01660290/.ssh/id_rsa"
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk"
  type        = string
  default     = "Premium_LRS"
}

variable "os_disk_size" {
  description = "Size of the OS disk in gigabytes"
  type        = number
  default     = 32
}

variable "os_disk_caching" {
  description = "Caching type for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "linux_avs" {
  description = "Linux Availability Set"
  type        = string
  default     = "linux_avs"
}

variable "boot_diagnostics_storage_uri" {
  description = "URI of the storage account for boot diagnostics"
  type        = string
}

variable "vm_instances" {
  description = "Map of VM instances with unique names"
  type        = map(any)
  default     = {
    "n01660290-u-vm1" = {}
    "n01660290-u-vm2" = {}
    "n01660290-u-vm3" = {}
  }
}

variable "lb_backend_pool_id" {
  description = "The ID of the Load Balancer backend address pool."
  type        = string
}

variable "assignment" {
  description = "Assignment tag value"
  type        = string
  default     = "CCGC 5502 Automation Assignment"
}

variable "name" {
  description = "Name tag value"
  type        = string
  default     = "Shradha Gopi"
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
