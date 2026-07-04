provider "aws" {
region = "ap-south-1"
}

module "ec2_instance" {
source = "./modules/ec2_instance"
ami = "ami-01a00762f46d584a1"
instance_type = "t3.micro"
subnet = "subnet-08b70d8e4d228e42c"
}

