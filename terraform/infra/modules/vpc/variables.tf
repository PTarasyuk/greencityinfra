variable "env_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "cidr_block" {
  type = string
}

variable "enable_flow_log" {
  type = bool
  default = false
}

variable "enable_nat_gateway" {
  type = bool
  default = true
}

variable "single_nat_gateway" {
  type = bool
  default = false
}

variable "one_nat_gateway_per_az" {
  type = bool
  default = true
}
