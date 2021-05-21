##################################################################################
# VARIABLES
##################################################################################

variable "project" {}
variable "region"  {}
variable "company_name" {}
variable "business_unit" {}
variable "environment_tag" {}



##################################################################################
# RESOURCES - VPC
##################################################################################

resource "google_compute_network" "vpc" {
    name                    =   "${local.co_name}-${local.biz_name}-${local.env_name}-vpc-1"
    auto_create_subnetworks = false
  
}

##################################################################################
# RESOURCES - SUBNETWORKS (This will create subnetworks with a netmask of 24 bits)
##################################################################################

resource "google_compute_subnetwork" "subnet" {
  count                     =   var.subnet_count[terraform.workspace]
  name                      =   "${local.co_name}-${local.biz_name}-${local.env_name}-subnet-${count.index + 1}"
  ip_cidr_range             =   cidrsubnet(var.network_address_space[terraform.workspace], 5, count.index)
  network                   =   google_compute_network.vpc.id
  private_ip_google_access  =   true

  log_config  {
      aggregation_interval = "INTERVAL_5_MIN"
      flow_sampling        = 0.5
      metadata  = "INCLUDE_ALL_METADATA"
    }

}