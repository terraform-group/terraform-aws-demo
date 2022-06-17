terraform {
  backend "s3" {
    bucket = "terraform-state-demozeyang"
    key    = "env/dev/service/terraform-service.tfstate"
    region = "us-east-1"
  }
}
