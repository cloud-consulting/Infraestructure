resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name = "scalable-nginx-example"

    labels {
      App = "ScalableNginxExample"
    }
  }

  spec {
    replicas = 1

    selector {
      App = "ScalableNginxExample"
    }

    template {
      container {
        image = "nginx:1.7.8"
        name  = "example"

        port {
          container_port = 80
        }

        resources {
          limits {
            cpu    = "0.2"
            memory = "200Mi"
          }

          requests {
            cpu    = "0.1"
            memory = "50Mi"
          }
        }
      }
    }
  }
}