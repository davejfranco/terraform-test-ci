
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"
  
  name = var.name
  cidr = var.network_cidr 

  azs             = var.azs  
  private_subnets = var.private_subnets 
  public_subnets  = var.public_subnets 

  enable_nat_gateway = var.enable_nat
  enable_vpn_gateway = var.enable_vpn

  tags = var.tags
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.name

  tags = var.tags
}






