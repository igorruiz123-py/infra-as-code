terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "igor"
}

module "cloudsocket_ec2" {
  source = "./cloudsocket/ec2"
}

module "cloudsocket_s3_bucket" {
  source = "./cloudsocket/s3_bucket"
}

module "cloudsocket_cloudwatch" {
  source = "./cloudsocket/cloudwatch"
}

module "ec2-cpu-usage-alarms" {
  source = "./lambdas/ec2-cpu-usage-alarms"
}

module "ec2-storage-usage-alarm" {
  source = "./lambdas/ec2-storage-usage-alarm"
}