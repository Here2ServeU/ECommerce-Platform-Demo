variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for DynamoDB (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "Primary key hash attribute name"
  type        = string
}

variable "hash_key_type" {
  description = "Primary key hash attribute type (S or N)"
  type        = string
}

variable "range_key" {
  description = "Primary key range attribute name (optional)"
  type        = string
  default     = null
}

variable "range_key_type" {
  description = "Primary key range attribute type (S or N), required if range_key is set"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the table"
  type        = map(string)
  default     = {}
}
