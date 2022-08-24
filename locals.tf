locals {
  role_name = {
    for index, role in postgresql_role.first :
    role.name => role.id
  }
}

locals {
  db_name = {
    for index, db in azurerm_postgresql_flexible_server_database.main :
    db.name => db.id
  }
}