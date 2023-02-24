terraform {
  cloud {
    organization = "lintonf"

    workspaces {
      name = "personal-infra"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
