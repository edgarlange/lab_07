resource "aws_instance" "public_ec2" {
  # count                  = length(var.instancias)
  for_each               = toset(var.instancias)
  ami                    = var.ec2_spec.ami
  instance_type          = var.ec2_spec.instance_type
  subnet_id              = module.vpc.public_subnet[count.index] # aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.lange2_key.key_name
  vpc_security_group_ids = [module.olympo_vpc.aws_security_group.sg_public_instance.id] # [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = each.value
  }
}

resource "aws_instance" "monitoring_ec2" {
  count                  = var.enable_monitoring == 1 ? 1 : 0
  ami                    = var.ec2_spec.ami
  instance_type          = var.ec2_spec.instance_type
  subnet_id              = module.vpc.public_subnet[count.index]
  key_name               = data.aws_key_pair.lange2_key.key_name
  vpc_security_group_ids = [module.olympo_vpc.aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "Monitoreo"
  }
}
