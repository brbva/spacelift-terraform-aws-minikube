output "kube_vpc_id" {
  value = aws_vpc.kube_vpc.id
}

output "subnet_id" {
  value = aws_subnet.kube_public_subnet.id
}

output "security_group_id" {
    value = aws_security_group.kube_sg_ssh.id
}