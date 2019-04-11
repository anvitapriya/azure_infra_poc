variable "module_base" {
  default = "https://github.com/anvitapriya/azure_infra_poc.git"
}

### resource-group variables
variable "resource_group_name" {
  default     = "TenantResources"
  description = ""
}

variable "location" {
  default     = "South India"
  description = "South India"
}

### storage variables



### virtual network variables

variable "vnet_name" {
  default     = "TenantVnet"
  description = ""
}

variable "vnet_address_space" {
  default     = "10.0.0.0/28"
  description = ""
}


variable "subnet_name" {
  default     = "tenantsubnet"
  description = ""
}


variable "subnet_address_spaces" {
  default     = ["10.0.0.0/29"]
  description = ""
}

variable "nic_name" {
	default  = ""
	description = "nic name"
}

variable "vm_name" {
	default  = "TenantDocker"
	description = "VM to run docker"
}

variable "subnet_id"
{
	default 	 =  ""
	description  =  "subnet id"
}

variable "private_ip_address_allocation"
{
	default 	 =  ""
	description  =  "private_ip_address_allocation"
}

variable "private_ip_address"
{
	default 	 =  ""
	description  =  "private_ip_address"
}

variable "name"
{
	default  =  ""
}
