terraform {
  source  = "tfr:///yashhirulkar701/ec2-instance/aws?version=1.0.0"
}

locals {
  common_vars = yamldecode(
  file("${find_in_parent_folders("common_vars.yaml")}"),
  )
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    profile = "yash"
    region  = "ap-south-1"
}
EOF
}

inputs = {
  ami_id = "ami-08df646e18b182346"
  availability_zone = "ap-south-1a"
  instance_type = local.common_vars.locals.instance_type
  tags =  "YASH Terragrunt Mumbai"
  key_name = "new_key"
  
  
}