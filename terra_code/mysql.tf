provider "kubernetes" {
  config_context_cluster   = "minikube"
}

resource "kubernetes_pod" "mysql" {
  metadata {
    name = "mysql-pod"
    labels = {
      env = "dev",
      app = "mysql"
    }
  }

  spec {
    container {
      image = "mysql:5.6"
      name  = "mysqlcon"
    env {
        name  = "MYSQL_ROOT_PASSWORD"
        value = "redhat"
       }
    env {
        name  = "MYSQL_DATABASE"
        value = "mydb"
       }
   env {
        name  = "MYSQL_USER"
        value = "gaurav"
       }
   env {
        name  = "MYSQL_PASSWORD"
        value = "mypassword"
       }
    }
  }
}