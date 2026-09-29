variable "subscription_id" {
  description = "Azure subscription to deploy into"
  type        = string
}

variable "prefix" {
  description = "Name prefix for resources"
  type        = string
  default     = "sentinel-lab"
}
