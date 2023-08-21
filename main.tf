terraform {
  cloud {
    organization = "terraform-lange"
    workspaces {
      name = "Lab_07"
    }
  }
}

module "olympo_vpc" {
  source              = "./modules/vpc"
  vpc_name            = "vpc_virginia-${local.sufix}"
  virginia_cidr       = "10.215.0.0/16"
  subnets             = ["10.215.100.0/24", "10.215.1.0/24"]
  ingress_port_list   = [22, 80, 443]
  sg_ingress_cidr     = "190.140.80.94/32"
  public_subnet_name  = "public_subnet-${local.sufix}"
  private_subnet_name = "private_subnet-${local.sufix}"
}
module "olympo_bucket" {
  source      = "./modules/s3"
  bucket_name = local.s3-sufix
}





# Outputs

output "s3_arn" {
  value = module.olympo_bucket.s3_bucket_arn

}

output "vpc_id" {
  value = module.olympo_vpc.vpc_id

}
