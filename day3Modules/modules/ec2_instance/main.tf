terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.52"
    }
  }
  required_version = ">=1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "ec2-1" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet
}
