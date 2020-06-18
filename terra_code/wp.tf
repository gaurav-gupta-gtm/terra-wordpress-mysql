resource "kubernetes_service" "wp_service" {
  metadata {
    name = "wp-pod"
  }
  spec {
    selector = {
      app = kubernetes_pod.wordpress.metadata.0.labels.app
    }
    port {
      port        = 80
    }

    type = "NodePort"
  }
}
resource "kubernetes_pod" "wordpress" {
  metadata {
    name = "wp-pod"
    labels = {
      env = "dev",
      app = "wp"
    }
  }

  spec {
    container {
      image = "wordpress:4.8-apache"
      name  = "wpcon1"
    }
  }
}