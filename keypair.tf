#Resource to Create Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = file("lange_key.pub")
}
