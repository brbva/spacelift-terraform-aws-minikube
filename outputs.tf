output "node_ip" {
    value = aws_instance.kube_node.public_ip
}