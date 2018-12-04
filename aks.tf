resource "azurerm_kubernetes_cluster" "aks" {

  name                = "${var.aks_name}"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  dns_prefix          = "${var.aks_dns_prefix}"

  kubernetes_version  =  "${var.aks_version}"

  linux_profile {
    admin_username = "${var.aks_linux_admin}"
    
    ssh_key {
      key_data = "${var.aks_linux_ssh_key}"
    }

  }

  agent_pool_profile {
    name            = "${var.aks_agent_pool}"
    count           = "${var.aks_agent_count}"
    vm_size         = "${var.aks_agent_size}"
    os_type         = "Linux"
    os_disk_size_gb = 30
    vnet_subnet_id  = "${azurerm_subnet.main-aks.id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }
 
}