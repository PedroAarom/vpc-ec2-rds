module "vpc" {
 source = "./modules/vpc"
 aws_region = "us-east-1"
 vpc_cidr = "10.0.0.0/16"
 public_subnet_cidr = "10.0.1.0/24"
 private_subnet_cidr = "10.0.2.0/24"
 availability_zone = "us-east-1a"
}

module "compute" {
 source = "./modules/compute"
 ami = "ami-08a0d1e16fc3f61ea"
 instance_type = "t2.micro"
 key_name = "vockey"
 myvpc = module.vpc.vpc_id
 subnet = module.vpc.public_subnet_id
}

module "rds" {
 source = "./modules/rds"
 allocated_storage    = 10
 db_name              = "mydb"
 engine               = "mysql"
 engine_version       = "8.0"
 instance_class       = "db.t3.micro"
 username             = "foo"
 password             = "foobarbaz"
 parameter_group_name = "default.mysql8.0"
 skip_final_snapshot  = true
}
