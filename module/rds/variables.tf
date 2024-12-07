variable "allocated_storage" {
  description = "The size of the RDS instance storage in GB"
  type        = number
}

variable "engine" {
  description = "The database engine (e.g., mysql, postgres)"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "The instance class for RDS"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  type        = bool
}

variable "subnet_group" {
  description = "The DB subnet group name"
  type        = string
}

variable "security_group_ids" {
  description = "The security group IDs for RDS access"
  type        = list(string)
}
