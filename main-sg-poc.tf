provider "aws" {

  region   = "us-east-1"

}

resource "aws_instance" "instance" {

  ami = "ami-048868b0946c2c6f7"
  instance_type = "t2.micro"
  key_name = "packer-infy-key"
  security_groups = "sg-0d5f1226d7c258fa6"
}
