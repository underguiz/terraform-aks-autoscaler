variable "main_resource_group" { }

variable "main_resource_group_location" {
	default     = "East US 2"
}

variable "main_vnet_name" { }

variable "main_vnet_space" {
	default = "10.66.0.0/16"
}

variable "aks_subnet_address" {
	default = "10.66.0.0/24"
}

variable "client_id" { }

variable "client_secret" { }

variable "tenant_id" { }

variable "subscription_id" { }

variable "aks_name" { }

variable "aks_dns_prefix" { }

variable "aks_linux_admin" { }

variable "aks_linux_ssh_key" { }

variable "blogdb_login" { }

variable "blogdb_password" { }

variable "blogdb_name" { }

variable "blogdb_sku" {
	type     = "map"
	default  = {
       name     = "B_Gen4_1"
       capacity = "1"
       tier     = "Basic"
       family   = "Gen4"
  }
}

variable "blogdb_storage" {
	type     = "map"
	default  = {
       size             = "5120"
       backup_retention = "7"
  }
}

variable "blogdb_version" {
	default = "5.7"
}

variable "aks_agent_size" {
  default = "Standard_DS1_v2"
}

variable "aks_agent_pool" {
  default = "agentpool"
}

variable "aks_agent_count" {
  default = "1"
}

variable "aks_agent_count_max" {
  default = "4"
}

variable "autoscaler_version" {
  default = "v1.13.0"
}

variable "aks_version" {
  default = "1.11.5"
}




