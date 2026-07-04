terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">=1.2.0"
}
provider "aws"{
    alias = "ap-south-1"
    region = "ap-south-1"
  }

  provider "aws" {
    alias = "ap-south-2"
    region = "ap-south-2"
  }

  resource "aws_instance" "t-server"{
    ami           = var.ami
    instance_type = var.area == "Production" ? "t3.micro":"t3.small"
    provider = aws.ap-south-1

    tags = {
      Name = "Terraform_Demo"
    }
  }


resource "aws_instance" "t-server1" {
   ami           = "ami-0ffa797f35095b9f7"
   instance_type = "t3.micro"
   provider = aws.ap-south-2

   tags = {
     Name = "Terraform_Demo1"
   }
  }
resource "aws_s3_bucket" "s3"{
  bucket = "my-tf-text-bucket-pbv27"
  tags = {
    name = "mybucket-pbsv27"
  }
}
resource "aws_instance" "t-server2"{
  ami = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  provider = aws.ap-south-1
  tags = {
    Name = "Terraform_Demo2"
  }
}
