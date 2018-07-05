resource "kubernetes_replication_controller" "wordpress" {
  "metadata" {
    name = "wordpress"
    labels {
      App = "wordpress"
    }
  }

  "spec" {
    replicas = 1

    "selector" {
      App = "wordpress"
    }

    "template" {

      container {
        name = "wordpress"
        image = "wordpress:latest"

        env {
            name  = "WORDPRESS_DB_HOST"
            value = "${azurerm_mysql_server.blogdb.fqdn}"
        }

        env {
        	name  = "WORDPRESS_DB_USER"
        	value = "${azurerm_mysql_server.blogdb.administrator_login}@${azurerm_mysql_server.blogdb.name}"
        }

        env {
        	name  = "WORDPRESS_DB_PASSWORD"
        	value = "${azurerm_mysql_server.blogdb.administrator_login_password}"
        }

        env {
        	name  = "WORDPRESS_DB_NAME"
        	value = "${azurerm_mysql_database.blogdb.name}"
        }

        port {
          container_port = 80
        }
        
        resources {
           requests {
               cpu = "100m"
           }
        }
      }
    }
  }
}