data "template_file" "node_resource_group" {
  template = "${file("autoscaler/node_resource_group.tpl")}"
  vars {
     resource_group = "${azurerm_kubernetes_cluster.aks.resource_group_name}"
     cluster_name   = "${azurerm_kubernetes_cluster.aks.name}"
     location       = "${azurerm_kubernetes_cluster.aks.location}"
  }
}

data "template_file" "autoscaler_config" {
  template = "${file("autoscaler/cluster-autoscaler-containerservice.yaml.tpl")}"

  vars {
     autoscaler_client_id           = "${base64encode(var.client_id)}"
     autoscaler_client_secret       = "${base64encode(var.client_secret)}"
     autoscaler_resource_group      = "${base64encode(azurerm_kubernetes_cluster.aks.resource_group_name)}"
     autoscaler_subscription_id     = "${base64encode(var.subscription_id)}"
     autoscaler_tenant_id           = "${base64encode(var.tenant_id)}"
     autoscaler_cluster_name        = "${base64encode(azurerm_kubernetes_cluster.aks.name)}"
     autoscaler_node_resource_group = "${base64encode(data.template_file.node_resource_group.rendered)}"
     autoscaler_minimum             = "${var.aks_agent_count}"
     autoscaler_maximum             = "${var.aks_agent_count_max}"
     autoscaler_agentpool           = "${var.aks_agent_pool}"
     autoscaler_version             = "${var.autoscaler_version}"
  }
}

resource "null_resource" "kubernetes_config_autoscaler" {

  triggers {
    autoscaler_config_changed = "${data.template_file.autoscaler_config.rendered}"
  }

  provisioner "local-exec" {
    command = "rm -f autoscaler/kubeconfig"
  }

  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_kubernetes_cluster.aks.resource_group_name} --name ${azurerm_kubernetes_cluster.aks.name} -f autoscaler/kubeconfig"
  }

  provisioner "local-exec" {
    command = "kubectl apply --kubeconfig=autoscaler/kubeconfig -f metrics-server/"
  }

  provisioner "local-exec" {
    command = "kubectl apply --kubeconfig=autoscaler/kubeconfig -f - <<EOF\n${data.template_file.autoscaler_config.rendered}\nEOF"
  }

}