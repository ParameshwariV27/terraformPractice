##Define the AWS provider configuration
provider "aws" {
  region = "ap-south-1"
}

variable "cidr" {
description = "The CIDR block for the VPC"
default = "10.0.0.0/16"
}

resource "aws_key_pair" "example" {
key_name = "terrform-demo"
public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_vpc" "myvpc" {
cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.0.0/24"
availability_zone = "ap-south-1a"
map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "RT" {
vpc_id = aws_vpc.myvpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "rta1" {
subnet_id = aws_subnet.sub1.id
route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSg" {
name = "web"
vpc_id = aws_vpc.myvpc.id

ingress {
description= "HTTP from VPC"
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
description = "SSH from VPC"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress { 
from_port = 0
to_port =0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

tags = {
Name = "Web-sg"
}
}

resource "aws_instance" "server" {
ami = "ami-01a00762f46d584a1"
instance_type = "t3.micro"
key_name = aws_key_pair.example.key_name
vpc_security_group_ids = [aws_security_group.webSg.id]
subnet_id = aws_subnet.sub1.id
tags = {
Name = "Terraform-demo-day5"
}
connection {
type = "ssh"
user = "ubuntu"
private_key = file("~/.ssh/id_rsa")
host = self.public_ip
}


provisioner "file" {
source = "app.py"
destination = "/home/ubuntu/app.py"
}

provisioner "remote-exec" {
  inline = [
    "sudo apt update -y",
    "sudo apt install -y python3-pip",
    "sudo apt install -y python3-flask",

    "python3 --version",
    "python3 -c 'import flask; print(flask.__version__)'",

    "sudo python3 /home/ubuntu/app.py",

    "echo DONE"
  ]
}
}

