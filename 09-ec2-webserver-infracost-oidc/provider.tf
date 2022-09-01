terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.27.0"
    }
  }

  backend "s3" {
    bucket          = "infrati-tfstate-infracost" //S3 Bucket Name
    key             = "tf_infracost/terraform.tfstate"
    region          = "us-east-1"
    encrypt         = "true"
    dynamodb_table  = "infrati-tfstate-infracost-locking" //DynamoDB Table Name    
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}