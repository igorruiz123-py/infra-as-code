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

module "tcp_server" {
  source = "./EC2/tcp-server"
}

module "tcp_server_files" {
  source = "./S3/tcp-server-files"
}