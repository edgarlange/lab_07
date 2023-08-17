locals {
  sufix = "${var.tags.Project}-${var.tags.Env}-${var.tags.Region}" #recurso-olympo-env-region
}

resource "random_string" "sufijo-s3" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-sufix = "${var.tags.Project}-${random_string.sufijo-s3.id}"
}
