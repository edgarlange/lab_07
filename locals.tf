locals {
  prefix-sufix = "${var.tags.Project}-${var.tags.Env}-${var.tags.Region}" #prefix-project-env-region-sufix
}

resource "random_string" "prefix_sufix_s3" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-random = random_string.prefix_sufix_s3.id
}
