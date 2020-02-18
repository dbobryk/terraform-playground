resource "kubernetes_deployment" "example" {
  provider = kubernetes.public
  metadata {
    name = "terraform-example"
    labels = {
      app = "MyExampleApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          app = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "example"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

//          liveness_probe {
//            http_get {
//              path = "/nginx_status"
//              port = 80
//
//              http_header {
//                name  = "X-Custom-Header"
//                value = "Awesome"
//              }
//            }
//
//            initial_delay_seconds = 3
//            period_seconds        = 3
//          }
        }
      }
    }
  }
}
