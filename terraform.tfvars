tags = {
  "Env"         = "dev"
  "Proyecto"    = "Terraform"
  "Owner"       = "Lange"
  "IAC"         = "Terraform"
  "Cloud"       = "AWS"
  "IAC_Version" = "v1.5.2"
  "Project"     = "olympo"
  "Region"      = "virginia"
}

sg_ingress_cidr = "190.140.80.94/32"

ec2_spec = {
  "ami"           = "ami-0f34c5ae932e6f0e4"
  "instance_type" = "t2.micro"
}

enable_monitoring = 0
