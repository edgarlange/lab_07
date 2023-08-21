resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.principal.id
  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_vpc" "principal" {
  cidr_block = var.principal_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.principal.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.principal.id
  cidr_block = var.subnets[1]
  tags = {
    Name = var.private_subnet_name #"Private subnet"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.principal.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public custom routing table"
  }
}

resource "aws_route_table_association" "asociate_crt" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance SG"
  description = "Allow ingress SSH"
  vpc_id      = aws_vpc.principal.id

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }
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
