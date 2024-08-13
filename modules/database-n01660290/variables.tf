variable "server_name" {
  description = "The name of the PostgreSQL server."
  type        = string
}

variable "location" {
  description = "The location where the PostgreSQL server will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name for the PostgreSQL server."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator password for the PostgreSQL server."
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "The name of the PostgreSQL database."
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


