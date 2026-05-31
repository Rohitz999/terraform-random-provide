resource "random_string" "joy" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "joy" {
  bucket = "tom-${random_string.joy.result}"
}