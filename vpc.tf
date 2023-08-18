terraform {
  cloud {
    organization = "terraform-lange"

    workspaces {
      name = "Lab_07"
    }
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "IGW VPC Virginia"
  }
}

resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "vpc_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "Private subnet"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public CRT"
  }
}

resource "aws_route_table_association" "asociate_crt" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance SG"
  description = "Allow ingress SSH"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    description = "SSH From Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  ingress {
    description = "http From Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  ingress {
    description = "https From Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public instance SG"
  }
}
