variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

#Variable Declaration
# variable "public_key" {
#   type    = string
#   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7SExj4z0z75wXauOm86LHY0xhJLsf2/s9NOjs+hsKxgO98SGWEIhuHg9yQpHUVCrkHdVjG7AUGlSoBKZ/6HAwERxMVBHnWocs1LNGrsQTbvAfz5XQh6w8BLREoP9C8TVqFp3c2wVaItP1Tzqqyp+CjUxK1RlOZ3pw9ZI5m2DG/UbsMC2XfqEkQ2k2btIAIADP5Eg+F8Hv4tFALxcfufSD08hYJU9MCkOh4G5kY6JxEcAHkPPJqcwi+yAkfAZR/CztGFRiOLq16yPhkbSOT4IZAk5xFBpVYbnOfHUPacyyjO3g+8fHaD8CHM1cc0YETXjYoLjHYOe5h/crB1sQjIW/TILqgBLqCokYlRfEUsPqbknxPlwFeNhSkf6Nry8RnFDtXvUeNVBdJsMSDkN/uUyWWxTCWD5guhQMUuN2d+Shu6AnX9Z0fgMKoKtlxBmLWB17f/iR6h+faPB69sNQp0Rpxx2OGGSa5N36bw77g9ad0mvUIE/xfEbEDp7KGf9f7Dd/mQr0tlocRnNtj7GQ8QRPIMDjCrygzQOx2up360x+9E4qhNiU1Du+QTigNqracj0RFPuGsbgfOoBV4Y9mvdrvgyie7blonUIq3y45bb/vYaquXnB+R5J6001thHPLT74Tt558ck739EpUXJbYW9fx22kpYENuwJTenWXdEDdINw== edgarlange@Edgars-MacBook-Air.local"
# }

#Variable Declaration
variable "key_pair_name" {
  type    = string
  default = "lange_key"
}

variable "ec2_spec" {
  description = "Parametros de la instancia"
  type        = map(string)

}
variable "instancias" {
  description = "Nombre de las EC2"
  type        = list(string)
  default     = ["apache"]
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type        = number
}
