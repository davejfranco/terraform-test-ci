variables {

  name = "daveops-test-youtube-stream"

  network_cidr = "172.16.0.0/16"

  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

  private_subnets = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
  public_subnets = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]

  enable_nat = true
  enable_vpn = true

  tags = {
    Terraform   = "true"
    Environment = "test"
  }

}


run "apply_test" {
  command = apply

  assert {
    condition = aws_s3_bucket.bucket.id == "daveops-test-youtube-stream"
    error_message = "The S3 bucket daveops-test-youtube-stream was not created."

  }

  assert {
    condition = module.vpc.vpc_id != ""
    error_message = "The VPC was not created."
  }

}
