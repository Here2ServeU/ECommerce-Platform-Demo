variable "name" {
  description = "Name of the Step Function state machine"
  type        = string
}

variable "definition_file" {
  description = "Path to the state machine definition JSON file"
  type        = string
}

variable "resource_arns" {
  description = "List of ARNs for resources that the state machine can access"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
