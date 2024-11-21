provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "app_vpc" {
  cidr_block = var.app_vpc_cidr_block

  tags = {
    Name = "app_vpc"
  }
}

# Public Subnet A
resource "aws_subnet" "app_vpc_public_a" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.app_vpc_public_a_cidr_block
  availability_zone       = var.app_vpc_public_a_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "app_vpc_public_a"
  }
}

# Public Subnet B
resource "aws_subnet" "app_vpc_public_b" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.app_vpc_public_b_cidr_block
  availability_zone       = var.app_vpc_public_b_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "app_vpc_public_b"
  }
}

# Private Subnet A
resource "aws_subnet" "app_vpc_private_a" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.app_vpc_private_a_cidr_block
  availability_zone       = var.app_vpc_private_a_availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = "app_vpc_private_a"
  }
}

# Private Subnet B
resource "aws_subnet" "app_vpc_private_b" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.app_vpc_private_b_cidr_block
  availability_zone       = var.app_vpc_private_b_availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = "app_vpc_private_b"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "my_IGW"
  }
}

# Route Tables and Associations
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "IG" {
  subnet_id      = aws_subnet.app_vpc_public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "IGB" {
  subnet_id      = aws_subnet.app_vpc_public_b.id
  route_table_id = aws_route_table.public.id
}

# Elastic IP and NAT Gateway
resource "aws_eip" "nat_ip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.app_vpc_public_a.id

  tags = {
    Name = "nat_gateway"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "PG" {
  subnet_id      = aws_subnet.app_vpc_private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "PGB" {
  subnet_id      = aws_subnet.app_vpc_private_b.id
  route_table_id = aws_route_table.private.id
}

# Security Group
resource "aws_security_group" "sk" {
  vpc_id = aws_vpc.app_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_group"
  }
}

# public Instances A
resource "aws_instance" "public_instance_AZ_A" {
  ami           = var.public_instance_AZ_A_ami
  instance_type = var.public_instance_AZ_A_instance_type
  key_name      = var.public_instance_AZ_A_key_name
  subnet_id     = aws_subnet.app_vpc_public_a.id

  vpc_security_group_ids = [aws_security_group.sk.id]

  root_block_device {
    volume_size = var.public_instance_AZ_A_volume_size
    volume_type = var.public_instance_AZ_A_volume_type
  }

  tags = {
    Name = "public_instance_A"
  }
}

# public Instances B
resource "aws_instance" "public_instance_AZ_B" {
  ami           = var.public_instance_AZ_B_ami
  instance_type = var.public_instance_AZ_B_instance_type
  key_name      = var.public_instance_AZ_B_key_name
  subnet_id     = aws_subnet.app_vpc_public_b.id

  vpc_security_group_ids = [aws_security_group.sk.id]

  root_block_device {
    volume_size = var.public_instance_AZ_B_volume_size
    volume_type = var.public_instance_AZ_B_volume_type
  }

  tags = {
    Name = "public_instance_A"
  }

}

# private Instances A

resource "aws_instance" "private_instance_AZ_A" {
  ami           = var.private_instance_AZ_A_ami
  instance_type = var.private_instance_AZ_A_instance_type
  key_name      = var.private_instance_AZ_A_key_name
  subnet_id     = aws_subnet.app_vpc_private_a.id

  vpc_security_group_ids = [aws_security_group.sk.id]

  root_block_device {
    volume_size = var.private_instance_AZ_A_volume_size
    volume_type = var.private_instance_AZ_A_volume_type
  }

  tags = {
    Name = "private_instance_A"
  }
}

# private Instances B

resource "aws_instance" "private_instance_AZ_B" {
  ami           = var.private_instance_AZ_B_ami
  instance_type = var.private_instance_AZ_B_instance_type
  key_name      = var.private_instance_AZ_B_key_name
  subnet_id     = aws_subnet.app_vpc_private_b.id

  vpc_security_group_ids = [aws_security_group.sk.id]

  root_block_device {
    volume_size = var.private_instance_AZ_B_volume_size
    volume_type = var.private_instance_AZ_B_volume_type
  }

  tags = {
    Name = "private_instance_A"
  }
}
