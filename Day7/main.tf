provider "aws" {

region = "ap-south-1"
}

provider "vault" {
address = "http://13.235.238.5:8200"
skip_child_token = true

auth_login {
path="auth/approle/login"

parameters = {
role_id = "8a8f5abd-d851-3558-efba-fb3cfdb81c74"
secret_id = "83ecdf6b-eba7-0cd8-6e1c-ec5ea3772556"
}
}
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "name" {
ami = "ami-01a00762f46d584a1"
instance_type = "t3.micro"
tags = {
Secret =data.vault_kv_secret_v2.example.data["username"]
}
}

resource "aws_s3_bucket" "my_bucket_pbvkg272611" {
bucket = data.vault_kv_secret_v2.example.data["usr"]
}