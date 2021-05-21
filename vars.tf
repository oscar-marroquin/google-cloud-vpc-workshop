##################################################################################
# Google Cloud Variables
##################################################################################

variable network_address_space {
  type = map(string)
}
variable "subnet_count" {
  type = map(number)
}

##################################################################################
# LOCALS
##################################################################################

locals {
  env_name  =  lower(terraform.workspace)
  co_name   =  lower(var.company_name)
  biz_name  =  lower(var.business_unit)

}