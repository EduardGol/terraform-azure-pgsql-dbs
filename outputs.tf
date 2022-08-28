output "subnet_name"{
    description = "The id of the newly created subnet"
    value       = azurerm_subnet.pgsql.name
}
output "subnet_id"{
    description = "The name of the newly created subnet"
    value       = azurerm_subnet.pgsql.id
}
output "private_dns_zone_name"{
    description = "The name of the newly created private dns zone"
    value       = azurerm_private_dns_zone.pgsql.name
}
output "private_dns_zone_id"{
    description = "The id of the newly created private dns zone"
    value       = azurerm_private_dns_zone.pgsql.id
}
output "azurerm_private_dns_zone_virtual_network_link_pgsql_name"{
    description = "The name of the newly created private dns private dns zone virtual network link"
    value       = azurerm_private_dns_zone_virtual_network_link.pgsql.name
}
output "azurerm_private_dns_zone_virtual_network_link_pgsql_id"{
    description = "The id of the newly created private dns private dns zone virtual network link"
    value       = azurerm_private_dns_zone_virtual_network_link.pgsql.id

}
output "azurerm_postgresql_flexible_server_name"{
    description = "The name of the newly created postgresql flexible server"
    value       = azurerm_postgresql_flexible_server.main.name
}
output "azurerm_postgresql_flexible_server_id"{
    description = "The id of the newly created postgresql flexible server"
    value       = azurerm_postgresql_flexible_server.main.id

}
output "azurerm_postgresql_flexible_server_database_name"{
    description = "The name of the newly created postgresql database"
    value       = azurerm_postgresql_flexible_server_database.main.name

}
output "azurerm_postgresql_flexible_server_database_id"{
    description = "The id of the newly created postgresql database"
    value       = azurerm_postgresql_flexible_server_database.main.id

}