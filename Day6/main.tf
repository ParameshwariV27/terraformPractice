provider "aws" {
region = "ap-south-1"
}

variable "ami" {
description = "The AMI ID for the instance"
}

variable "instance_type" {
description = "The type of instance to launch"
type = map(string)

default = {
"dev" = "t3.micro"
"stage"="t3.medium"
"prod" = "t3.small"
}
}

module "ec2_instance" {
source = "./modules/ec2_instance"
ami = var.ami
instance_type = lookup(var.instance_type,terraform.workspace,"t3.small")
}