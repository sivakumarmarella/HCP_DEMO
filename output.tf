output "vpc_id" {
  value = aws_vpc.shiva.id

}

output "ec2_public_ips" {
  value = { for k, v in aws_instance.public_server1 : k => v.public_ip }
}

output "ec2_instance_ids" {
  value = { for k, v in aws_instance.public_server1 : k => v.id }
}