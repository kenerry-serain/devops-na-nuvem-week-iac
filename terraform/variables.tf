variable "tags" {
  type = object({
    environment = string,
    project     = string
  })

  default = {
    environment = "Production"
    project     = "youtube-live"
  }
}

variable "vpc" {
  type = object({
    name                        = string,
    cidr                        = string,
    internet_gateway_name       = string,
    public_route_table_name     = string,
    private_route_table_name    = string,
    nat_gateway_elastic_ip_name = string,
    nat_gateway_name            = string
  })

  default = {
    name                        = "youtube-live-vpc"
    cidr                        = "10.0.0.0/24",
    internet_gateway_name       = "youtube-live-internet-gateway",
    public_route_table_name     = "youtube-live-public-route-table",
    private_route_table_name    = "youtube-live-private-route-table",
    nat_gateway_elastic_ip_name = "youtube-live-nat-gateway-elastic-ip"
    nat_gateway_name            = "youtube-live-nat-gateway"
  }
}

variable "public_subnets" {
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))

  default = [{
    name                    = "youtube-live-public-subnet-1a",
    cidr_block              = "10.0.0.0/26",
    availability_zone       = "us-east-1a",
    map_public_ip_on_launch = true
    },
    {
      name                    = "youtube-live-public-subnet-1b",
      cidr_block              = "10.0.0.64/26",
      availability_zone       = "us-east-1b",
      map_public_ip_on_launch = true
  }]
}

variable "private_subnets" {
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))

  default = [{
    name                    = "youtube-live-private-subnet-1a",
    cidr_block              = "10.0.0.128/26",
    availability_zone       = "us-east-1a",
    map_public_ip_on_launch = false
    },
    {
      name                    = "youtube-live-private-subnet-1b",
      cidr_block              = "10.0.0.192/26",
      availability_zone       = "us-east-1b",
      map_public_ip_on_launch = false
  }]
}

variable "eks_cluster" {
  type = object({
    name                      = string,
    enabled_cluster_log_types = list(string)
  })

  default = {
    name                      = "youtube-live-eks-cluster-03"
    enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  }
}

variable "dns" {
  type = string
  default = "devopsnanuvemweek.com"
}