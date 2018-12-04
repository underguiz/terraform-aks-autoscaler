resource "kubernetes_horizontal_pod_autoscaler" "wordpress" {
  
  metadata {
    name = "wordpress"
  }
  
  spec {
    max_replicas                      = 8
    min_replicas                      = 1

    scale_target_ref {
      kind = "ReplicationController"
      name = "wordpress"
    }
    
  }

  depends_on = [ "null_resource.kubernetes_config_autoscaler" ]

}