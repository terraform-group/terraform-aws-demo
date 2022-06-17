provider "aws" {
  region = "us-east-1"
}

locals {
  ami_id            = "ami-06640050dc3f556bb"
  instance_type     = "t2.micro"
  subnet_id         = data.terraform_remote_state.network.outputs.subnet_id
  vpc_id            = data.terraform_remote_state.network.outputs.vpc_id
  security_group_id = data.terraform_remote_state.network.outputs.security_group_id
  instance          = ["server1", "server2"]
  instance_config = {
    server1 = {
      ipv4_address      = "172.16.10.20"
      availability_zone = "us-east-1a"
      subnet_id         = local.subnet_id[0]
    },
    server2 = {
      ipv4_address      = "172.16.50.20"
      availability_zone = "us-east-1b"
      subnet_id         = local.subnet_id[1]
    },

  }

  ecs_ids = [for k, v in aws_instance.web : v.id]

  dns_zone_name = "zeyang.site"

}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-state-demozeyang"
    key    = "env/dev/network/terraform-network.tfstate"
    region = "us-east-1"
  }
}

provider "alicloud" {
   region = "cn-beijing"
}