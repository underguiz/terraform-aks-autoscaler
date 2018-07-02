resource "azurerm_mysql_server" "blogdb" {
  name                = "${var.blogdb_name}"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

  sku {
    name     = "${var.blogdb_sku["name"]}"
    capacity = "${var.blogdb_sku["capacity"]}"
    tier     = "${var.blogdb_sku["tier"]}"
    family   = "${var.blogdb_sku["family"]}"
  }

  storage_profile {
    storage_mb            = "${var.blogdb_storage["size"]}"
    backup_retention_days = "${var.blogdb_storage["backup_retention"]}"
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "${var.blogdb_login}"
  administrator_login_password = "${var.blogdb_password}"
  version                      = "${var.blogdb_version}"
  ssl_enforcement              = "Disabled"
}

resource "azurerm_mysql_database" "blogdb" {
  name                = "blogdb"
  resource_group_name = "${azurerm_resource_group.main.name}"
  server_name         = "${azurerm_mysql_server.blogdb.name}"
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_firewall_rule" "wordpress" {
  name                = "wordpress"
  resource_group_name = "${azurerm_resource_group.main.name}"
  server_name         = "${azurerm_mysql_server.blogdb.name}"
  start_ip_address    = "${kubernetes_service.wordpress.load_balancer_ingress.0.ip}"
  end_ip_address      = "${kubernetes_service.wordpress.load_balancer_ingress.0.ip}"
}