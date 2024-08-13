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

variable "windows_rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "windows_rg_location" {
  description = "The location/region where the resources are created"
  type        = string
}

variable "subnet2_id" {
  description = "ID of subnet2"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "n01660290"
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  default     = "Siju@123"
}

variable "windows_name" {
  description = "Map of Windows virtual machine names and sizes"
  type        = map(string)
  default     = {
    "n01660290-w-vm1" = "Standard_B1s"
  }
}

variable "win_storage_account_type" {
  description = "Storage account type for the OS disk"
  type        = string
  default     = "StandardSSD_LRS"
}

variable "win_disk_caching" {
  description = "Caching type for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "windows_publisher" {
  description = "Publisher for the Windows OS"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  description = "Offer for the Windows OS"
  type        = string
  default     = "WindowsServer"
}

variable "windows_sku" {
  description = "Sku for the Windows OS"
  type        = string
  default     = "2016-Datacenter"
}

variable "windows_version" {
  description = "Version of the Windows OS"
  type        = string
  default     = "latest"
}

variable "windows_avs" {
  description = "Name of the Windows Availability Set"
  type        = string
  default     = "windows_avs"
}

variable "boot_diagnostics_storage_uri" {
  description = "URI of the storage account for boot diagnostics"
  type        = string
}