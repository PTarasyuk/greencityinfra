variable "region" {
  type = string
}

variable "account_id" {
  type = string
}

variable "project_name" {
  type = string
  default = "greencity"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "cluster_version" {
  type    = string
  default = "1.32"
}

variable "external_dns_zone" {
  type    = string
  default = "greensity.space"
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
