resource "kubernetes_deployment_v1" "attack" {

  metadata {
    name = var.deployment_name
    namespace = kubernetes_namespace_v1.namespace.id
    labels = {
      name = var.deployment_name
    }
  }

  spec {
    replicas = var.number_of_replicas

    selector {
      match_labels = {
        name = var.deployment_name
      }
    }

    template {

      metadata {
        labels = {
          name = var.deployment_name
        }
      }

      spec {

        container {
          name = "${var.deployment_name}-container"
          image = var.ripper_image

          env {
            name = "ripper_attack_host"
            value = var.ripper_attack_host
          }
          env {
            name = "ripper_attack_port"
            value = var.ripper_attack_port
          }
          env {
            name = "thread_count"
            value = var.thread_count
          }
          env {
            name = "attack_method"
            value = var.attack_method
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "1024Mi"
            }
          }

        }
      }
    }

  }
}
