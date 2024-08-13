variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for all resources to ensure uniqueness"
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
