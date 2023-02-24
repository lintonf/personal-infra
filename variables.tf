# NAMING
variable "environment" {
  default = "euw1"
}
variable "namespace" {
  default = "lf"
}
variable "stage" {
  default = "prod"
}
variable "tags" {
  default = {
    Terraform   = "true"
    Environment = "prod"
  }
}

# AWS
variable "region" {
  default = "eu-west-1"
}
variable "availability_zones" {
  default = ["eu-west-1b", "eu-west-1c"]
}

# VPC
variable "vpc_cidr" {
  default = "10.0.0.0/24"
}
