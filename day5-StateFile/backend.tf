terraform {
  backend "s3" {
    bucket = "pbv27-terraform-state"
    key    = "pbv/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}

