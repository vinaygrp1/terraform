locals {
  ami_id = "ami-090252cbe067a9e58" # we copied from ec2.tf
  sg_id = "sg-0ddda219146586fb6" # copied ssecurity group in ec2.tf
  #instance_type = "t3.micro"
  instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
  tags ={
    name = "locals"
  }
}