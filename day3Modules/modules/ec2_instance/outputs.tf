output "public_ip_address" {
description = "printing public ip address"
value = aws_instance.ec2-1.public_ip
}
