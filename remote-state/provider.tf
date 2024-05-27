terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "vinaydevops-remote-state"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table ="vinaydevops-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}