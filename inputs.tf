variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "area" {
  description = "to mention the area :dev/stage/production"
  type = string
}
