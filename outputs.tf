output "private_dns_zone_name" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = azurerm_private_dns_zone.pgsql.name
}