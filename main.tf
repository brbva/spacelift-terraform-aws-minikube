module "network" {
  source = "./modules/network"
}

# Create security group
resource "aws_security_group" "kube_sg_ssh" {
  name        = "Allow SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.network.kube_vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_key_pair" "kube_ec2_auth" {
  key_name   = "kube_key"
  public_key = "~/.mtckey.pub"
}

resource "aws_instance" "kube_node" {
  ami                         = data.aws_ami.dev_server_ami.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.kube_ec2_auth.key_name
  vpc_security_group_ids      = [aws_security_group.kube_sg_ssh.id]
  subnet_id                   = module.network.kube_public_subnet
  user_data                   = file("userdata.sh")
  user_data_replace_on_change = true

  tags = {
    Name        = "K8s Single Node Cluster"
    Environment = "${var.env}"
  }
}

output "kube_vpc_id" {
  value = module.network.kube_vpc_id
}