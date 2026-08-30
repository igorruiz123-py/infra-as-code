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

module "ruizsocket_server" {
  source = "./EC2/ruizsocket-server"
}

module "ruizsocket_server_files" {
  source = "./S3/ruizsocket-server-bucket"
}

module "ruizsocket_server_logs_group" {
  source = "./cloudwatch/ruizsocket-server-log-group"
}