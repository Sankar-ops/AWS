module "vpc"{
  source = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"
  name = "demotf"
  cidr = local.vpc_cidr
  azs = local.azs
  private_subnets = local.private_subnets
  tags = local.tags

}