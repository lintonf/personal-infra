terraform {
  backend "s3" {
    bucket         = "287095433380-terraform"
    dynamodb_table = "287095433380-terraform"
    key            = "personal-infra/terraform.tfstate"
    region         = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}
