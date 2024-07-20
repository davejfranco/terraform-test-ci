
variable "name" {
  type = string
  default = "daveops"
}

variable "network_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type = list
 
  validation {
    condition = length(var.azs) > 0 && length(var.azs) <= 3 
    error_message = "The number of availability zones must be 3."
  }
  
}

variable "private_subnets" {
  type = list
}

variable "public_subnets" {
  type = list
}

variable "enable_nat" {
  type = bool
  default = true
}

variable "enable_vpn" {
  type = bool
  default = true
}

variable "tags" {
  type = map(string)
}


