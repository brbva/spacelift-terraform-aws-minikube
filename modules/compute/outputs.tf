output "node_ip" {
  value = "${aws_instance.kube_node.public_ip}"
}

output "node_dns" {
  value = "${aws_instance.kube_node.public_dns}"
}