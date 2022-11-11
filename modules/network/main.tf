# Create VPC
resource "aws_vpc" "kube_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "dev"
    env  = var.env
  }
}

# Create Subnet
resource "aws_subnet" "kube_public_subnet" {
  vpc_id                  = aws_vpc.kube_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "kube_public"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "kube_igw" {
  vpc_id = aws_vpc.kube_vpc.id

  tags = {
    Name = "kube_igw"
  }
}

# Create Route Table
resource "aws_route_table" "kube_public_rt" {
  vpc_id = aws_vpc.kube_vpc.id

  tags = {
    Name = "kube_public_rt"
  }
}

# Create Route Table entry
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.kube_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.kube_igw.id
}

# Create route table assocation
resource "aws_route_table_association" "kube_public_assoc" {
  subnet_id      = aws_subnet.kube_public_subnet.id
  route_table_id = aws_route_table.kube_public_rt.id
}

# Create security group
resource "aws_security_group" "kube_sg_ssh" {
  name        = "Allow SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.kube_vpc.id

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