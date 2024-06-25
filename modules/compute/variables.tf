variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}
variable "key_name" {
description = "AWS key_name."
}

variable "myvpc" {
  description = "ID of the VPC"
}
variable "subnet" {
  description = "ID of the public subnet"
}