variable "aws_region" {
  description = "The AWS region to deploy in"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}
variable "availability_zone" {
  description = "The availability zone where the subnet will be created"
  type        = string
}