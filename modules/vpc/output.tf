output "vpc_id" {
  value = aws_vpc.vpc_virginia.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "public_ec2_sg_id" {
  value = aws_security_group.sg_public_instance.id
}
