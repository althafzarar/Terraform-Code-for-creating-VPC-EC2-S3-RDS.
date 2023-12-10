terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"  # Updated the version to be compatible with the provider
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

resource "aws_instance" "web" {
  ami           = "ami-06dd92ecc74fdfb36"
  instance_type = "t3.micro"

  tags = {
    Name = "testterraforminstance"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-shiza-test-bucket"

  tags = {
    Name        = "Myterraformtestbucket"
    Environment = "Dev"
  }
}
