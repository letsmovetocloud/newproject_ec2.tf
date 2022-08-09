# Terraform Configure setting block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      
    }
  }
}

# Provider Block
provider "aws" {
  profile = "user" 
  region  = "us-west-1"
}

#Resource Block
resource "aws_instance" "ec2testserver" {
  ami           = "ami-041db4a969fe3eb68" 
  instance_type = "r4.medium"

}


# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "192.168.0.0/17"   
  azs                 = ["us-east-1a"]
  private_subnets     = ["192.168.1.0/24"]
  public_subnets      = ["192.168.2.0/24"]

#new comment added 
