provider "aws" {
region = "ap-south-1"
}

variable "ami" {
description = "The AMI ID for the instance"
}

variable "instance_type" {
description = "The type of instance to launch"
}

module "ec2_instance" {
source = "./modules/ec2_instance"
ami = var.ami
instance_type = var.instance_type
}