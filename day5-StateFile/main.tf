provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2" {
  instance_type = "t3.micro"
  ami = "ami-01a00762f46d584a1"
  tags = {
	Name = "stateFile-demo"
}
}

resource "aws_s3_bucket" "s3-terraform-state" {
bucket = "pbv27-terraform-state"
}

