terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=4.19.0"
    }
  }
  backend "s3" {
   encrypt = true
   bucket = "callofthevoid-terraform-statefiles"
   dynamodb_table = "terraform-statefile-locks"
   region = "eu-central-1"
   key = "cotv-test-bucket.tfstate"
 }
}

provider "aws" {
  alias  = "frankfurt"
  region = "eu-central-1"
}

module "bucket" {
  providers = {
    aws = aws.frankfurt
  }
  source = "git::https://github.com/rbjoergensen/tf-s3-bucket.git?ref=v1"
  bucket_name = "callofthevoid-test-bucket"
}