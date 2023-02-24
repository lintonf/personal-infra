# Personal Infra

## GitHub Actions

The process for deploying infrastructure is as follows:

- GitHub Actions run is triggered.
- GitHub Actions authenticated to [Terraform Cloud](https://app.terraform.io) using an API Token.
- Terraform Cloud authenticated to AWS using an Open ID Connect provider configured in my AWS account.
- Terraform Cloud assumes an IAM role with permissions to create/destroy resources.
- GitHub Actions performs a remote Plan on Terraform Cloud.
- GitHub Actions performs a remote Apply on Terraform Cloud.

All state files, locking, etc is handled by Terraform Cloud.
