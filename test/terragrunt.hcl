terraform{
  source  = "tfr:///terraform-aws-modules/ec2-instance/aws?version=4.1.4"
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
    region  = "ap-northeast-1"
}
EOF
}

inputs = {
  ami = "ami-0ecb2a61303230c9d"
  availability_zone = "ap-northeast-1a"
  instance_type = local.common_vars.locals.instance_type
  key_name = "tokiokey"
  tags = {
    Name = "YASH Terragrunt TOKIO"
  } 
}
