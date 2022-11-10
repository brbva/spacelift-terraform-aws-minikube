terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  #region                   = "us-west-2"
  #shared_credentials_files = ["/mnt/c/Users/Bjay/.aws/credentials"]
  profile                  = "vscode"
}