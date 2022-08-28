# terraform-azure-private-pgsql-dbs

## Create Azure "Private Database for PostgreSQL flexible server" & "Private Database for PostgreSQL flexible server databases"

This module deploy private postgresql server and database with subnet and private dns zone.

> Example
```yaml
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Production"
  }
}

module "pgsql" {
    source = "EduardGol/pgsql-dbs/azure"

    # Pgsql flexible server 
    name                    =   "example-pgsql-server"
    resource_group_name     =   azurerm_resource_group.example.name
    resource_group_location =   azurerm_resource_group.example.location
    vnet_name               =   azurerm_virtual_network.example.name
    vnet_id                 =   azurerm_virtual_network.example.id
    pgsql_subnet_prefixe    =   ["10.0.1.0/24"]
    pgsql_version           =   14

    administrator_login     =   "admin"
    administrator_password  =   "6nKw56449WV4uL7m"

    storage_size            =   32768
    sku_name                =   "GP_Standard_D4s_v3"

    # Pgsql databases
    database_name           =   ["db1", "db2",]
}
```