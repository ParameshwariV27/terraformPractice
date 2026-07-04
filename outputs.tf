
output "instance_id" {
value = aws_instance.t-server2.id
}

output "public_instance_id"{
value = aws_instance.t-server2.public_ip
}

