variable "name"{
  description = "Name of postgresql flexible server"
  type = string
}
variable "resource_group_name"{
  description = "Name of resource group"
  type = string
}
variable "resource_group_location"{
  description = "Location of resource group"
  type = string
}

variable "pgsql_version"{
  description = "Version of desired postgresql server"
  type = string
  default = "14"
}
variable "administrator_login"{
  description = "Initial user which will get administrator rights, login"
  type = string
}
variable "administrator_password"{
  description = "Initial user which will get administrator rights, password"
  type = string
}
variable "zone"{
  description = "Zone in which will be deployed postgresql server"
  type = number
  default = 1
}

variable "storage_size" {
  description = "Size of postgresql server in mb"
  type = number
  default = 32768
}

variable "sku_name" {
  description = "Instance type of postgresql server"
  type = string
}

variable "database_name" {
  description = "Desired database names"
  type        = list(string)
}

variable "collation" {
  type = string
  default = "en_US.utf8"
}

variable "charset" {
  type = string
  default = "utf8"
}

variable "name_subnet" {
  description = "Name of subnet"
  type = string
  default = "pgsql_subnet"
}

variable "vnet_name" {
  description = "Name of your virtual network"
  type = string
}

variable "pgsql_subnet_prefixe" {
  description = "The address space which is used by postgresql server"
  type = list(string)
}

variable "pgsql_private_dns_zone_name" {
  description = "Postgresql private dns zone name"
  type = string
  default = "main.postgres.database.azure.com"
}

variable "pgsql_private_dns_zone_vn_link_name" {
  description = "Private postgresql dns zone virtual network link name"
  type = string
  default = "pgsql-private-dns-zone-vn-link"
}

variable "vnet_id" {
  description = "Virtual Network id"
  type = string
}
