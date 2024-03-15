terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
   profile="default"
}

resource "aws_instance" "Project_server" {
count=3
ami = "ami-03bb6d83c60fc5f7c" #mumbai

instance_type = "t2.medium"
key_name      = "test1245"
#availability_zone = "ap-south-1a"  # Specify a different Availability Zone
#availability_zone = "us-east-1"  # Specify a different Availability Zone
associate_public_ip_address = true  # Add this line to associate a public IP address

tags = {
  Name= "Project_server"
  env="staging"
  tier="product"
}

}

output "public_ips" {
  value = [for instance in aws_instance.Project_server : instance.public_ip]
}

