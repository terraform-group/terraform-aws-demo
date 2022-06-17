provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-state-demozeyang"
  acl    = "private"

  versioning {
    enabled = true
  }
}



resource "aws_dynamodb_table" "tf-state-table" {
  name           = "tf-state-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
