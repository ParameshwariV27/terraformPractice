provider "aws" {
region = ap-south-1
}

variable "ami" {
description = "The AMI ID for the instance"
type = string
}
variable "instance_type" {
decsription = "The type of insatnce of launch"
type = string
}
resource "aws_instance" "example" {
ami = var.ami
instance_type = var.instance_type
}