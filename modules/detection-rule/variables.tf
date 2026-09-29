variable "workspace_id" {
  description = "Sentinel-enabled Log Analytics workspace ID"
  type        = string
}

variable "name" {
  description = "Rule ID, e.g. rg-deleted"
  type        = string
}

variable "display_name" {
  type = string
}

variable "description" {
  type = string
}

variable "severity" {
  type = string
  validation {
    condition     = contains(["Informational", "Low", "Medium", "High"], var.severity)
    error_message = "Severity must be Informational, Low, Medium or High."
  }
}

variable "query" {
  description = "KQL query text"
  type        = string
}

variable "tactics" {
  type = list(string)
}

variable "query_frequency" {
  type    = string
  default = "PT15M"
}

variable "query_period" {
  type    = string
  default = "PT30M"
}
