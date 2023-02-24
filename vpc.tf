module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.0.0"

  environment = var.environment
  namespace   = var.namespace
  stage       = var.stage

  name = "default"

  ipv4_primary_cidr_block = var.vpc_cidr

  tags = var.tags
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.1.0"

  environment        = var.environment
  namespace          = var.namespace
  stage              = var.stage
  name               = "default"
  vpc_id             = module.vpc.vpc_id
  igw_id             = [module.vpc.igw_id]
  ipv4_cidr_block    = [var.vpc_cidr]
  availability_zones = var.availability_zones

  private_subnets_enabled = false

  tags = var.tags
}

# module "sg_webserver" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "4.17.1"

#   name        = "webserver"
#   description = "Webserver Security Group"
#   vpc_id      = module.vpc.vpc_id

#   ingress_cidr_blocks = ["0.0.0.0/0"]
#   ingress_rules       = ["http-80-tcp", "https-443-tcp"]
# }
