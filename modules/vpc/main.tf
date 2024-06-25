provider "aws" {
 region = var.aws_region
}
# terraform {
# backend "s3" {
# bucket = "mybucket2121345"
# key = "path/to/terraform.tfstate"
# region = "us-east-1"
# }
# }
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
 
 vpc_id     = aws_vpc.main.id
 cidr_block = var.public_subnet_cidr
 availability_zone = var.availability_zone
 map_public_ip_on_launch = true
 
 tags = {
   Name = "Public Subnet"
 }
}

resource "aws_subnet" "private_subnet" {
 vpc_id     = aws_vpc.main.id
 cidr_block = var.private_subnet_cidr
 availability_zone = var.availability_zone
 map_public_ip_on_launch = false
 tags = {
   Name = "Private Subnet"
 }
}

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "my-igw"
 }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_as" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
