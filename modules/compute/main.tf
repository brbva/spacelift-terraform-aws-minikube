resource "aws_key_pair" "kube_ec2_auth" {
  key_name   = var.key_name
  public_key = file("/mnt/workspace/mtckey.pub")
}

resource "aws_instance" "kube_node" {
  ami                         = data.aws_ami.dev_server_ami.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.kube_ec2_auth.key_name
  vpc_security_group_ids      = var.security_group_id
  subnet_id                   = var.subnet_id
  user_data                   = file("${path.module}/userdata.sh")
  user_data_replace_on_change = true

  tags = {
    Name        = "${var.node_name}-dev"
    Environment = var.env
  }
}