provider "aws" {

  version = "~> 2.50"
  region   = "us-east-1"
  shared_credentials_file = "/root/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "instance" {

  ami = "ami-02eb6b1ce845efec3"
  instance_type = "t2.micro"
  key_name = "packer-infy-key"
  security_groups = ["packer-infysec-1"]
  tags = {
    "Name"      = "Terraform-poc-instances"
  }
}
