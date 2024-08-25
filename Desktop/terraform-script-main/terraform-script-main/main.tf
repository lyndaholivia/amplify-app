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
  region = "us-east-1"
  access_key = "****"
  secret_key = "****"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-2a"
  }

resource "aws_instance" "web" {
  ami           = "ami-066784287e358dad1"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
