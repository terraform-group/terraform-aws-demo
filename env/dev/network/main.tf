provider "aws" {
  region = "us-east-1"
}

locals {
  azs         = ["us-east-1a", "us-east-1b"]
  cidr_blocks = ["172.16.10.0/24", "172.16.50.0/24"]
  ports       = ["80", "443", "22"]
}