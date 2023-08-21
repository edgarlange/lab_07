resource "aws_instance" "public_ec2" {
  # count                  = length(var.instancias)
  for_each               = toset(var.instancias)
  ami                    = var.ec2_spec.ami
  instance_type          = var.ec2_spec.instance_type
  subnet_id              = module.olympo_vpc.public_subnet
  key_name               = data.aws_key_pair.lange2_key.key_name
  vpc_security_group_ids = [module.olympo_vpc.sg_public_instance[0]] # [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = each.value
  }
}

resource "aws_instance" "monitoring_ec2" {
  count                  = var.enable_monitoring == 1 ? 1 : 0
  ami                    = var.ec2_spec.ami
  instance_type          = var.ec2_spec.instance_type
  subnet_id              = module.olympo_vpc.public_subnet
  key_name               = data.aws_key_pair.lange2_key.key_name
  vpc_security_group_ids = [module.olympo_vpc.sg_public_instance]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "Monitoreo"
  }
}
