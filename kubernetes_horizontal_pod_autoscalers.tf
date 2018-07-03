resource "kubernetes_horizontal_pod_autoscaler" "wordpress" {
  
  metadata {
    name = "wordpress"
  }
  
  spec {
    max_replicas = 160
    min_replicas = 2
    scale_target_ref {
      kind = "ReplicationController"
      name = "wordpress"
    }
  }

  depends_on = [ "null_resource.kubernetes_config_autoscaler" ]

}