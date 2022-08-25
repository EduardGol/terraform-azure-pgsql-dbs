## ------ Create subnet & dns zone ------ ##
# resource "azurerm_subnet" "pgsql" {
#   name                 = var.name_sn
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.vnet_name
#   address_prefixes     = var.address_prefixes_sn
#   service_endpoints    = ["Microsoft.Storage"]
#   delegation {
#     name = "fs"
#     service_delegation {
#       name = "Microsoft.DBforPostgreSQL/flexibleServers"
#       actions = [
#         "Microsoft.Network/virtualNetworks/subnets/join/action",
#       ]
#     }
#   }
# }

# resource "azurerm_private_dns_zone" "pgsql" {
#   name                  = var.pgsql_private_dns_zone_name
#   resource_group_name   = var.resource_group_name

# }

# resource "azurerm_private_dns_zone_virtual_network_link" "pgsql" {
#   name                  = var.pgsql_private_dns_zone_vn_link_name
#   private_dns_zone_name = azurerm_private_dns_zone.pgsql.name
#   virtual_network_id    = var.vnet_id
#   resource_group_name   = var.resource_group_name
# }

## ------ Create Postgresql Server ------ ##
resource "azurerm_postgresql_flexible_server" "main" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  version                = var.pgsql_version
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = var.private_dns_zone_id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = var.zone

  storage_mb = var.storage_size

  sku_name   = var.sku_name
  depends_on = [var.azurerm_private_dns_zone_virtual_network_link]
}

## ------ Create Postgresl Database ------ ##
resource "azurerm_postgresql_flexible_server_database" "main" {
  count     = length(var.database_name)
  name      = var.database_name[count.index]
  server_id = azurerm_postgresql_flexible_server.main.id
  collation = var.collation
  charset   = var.charset
}