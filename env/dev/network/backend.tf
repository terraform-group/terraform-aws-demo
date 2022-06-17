terraform {
  backend "s3" {
    bucket = "terraform-state-demozeyang"
    key    = "env/dev/network/terraform-network.tfstate"
    region = "us-east-1"
  }
}
