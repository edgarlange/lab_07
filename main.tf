module "olympo_bucket" {
  source      = "./modules/s3"
  bucket_name = "olympo-ghjkl"
}


output "s3_arn" {
  value = module.olympo_bucket.s3_bucket_arn

}
