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

run "input_validation" {

  command = plan 


  assert {
    condition = length(var.azs) > 0 && length(var.azs) <= 3
    error_message = "The number of availability zones must be 3."

  }

}

run "invalid_azs" {

  command = plan 

  variables {
    azs = [ "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  }

  expect_failures = [
    var.azs,
  ]

}
