variable "env_name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_port" {
  type = number
  default = 5432
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "database_subnet_group" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr_blocks" {
  type = string
}

variable "tags" {
  type = map(string)
}
