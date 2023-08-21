variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "Nombre de la subnet publica"
  type        = string
}

variable "private_subnet_name" {
  description = "Nombre de la subnet privada"
  type        = string
}

variable "principal_cidr" {
  description = "CIDR Principal"
  type        = string
}

# variable "public_subnet" {
#   description = "CIDR Public subnet"
#   type        = string
# }

# variable "private_subnet" {
#   description = "CIDR Private subnet"
#   type        = string
# }

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "sg_ingress_cidr" {
  type        = string
  description = "CIDR Ingress traffic"
}

variable "ingress_port_list" {
  description = "lista de puertos ingress"
  type        = list(number)
}
