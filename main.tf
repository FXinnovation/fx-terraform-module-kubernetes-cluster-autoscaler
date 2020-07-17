#####
# Locals
#####

locals {
  annotations = {}
  labels = {
    version    = var.image_version
    managed-by = "terraform"
    name       = "cluster-autoscaler"
    part-of    = "cluster-autoscaler"
  }
  port = 8085
}

#####
# Randoms
#####

resource "random_string" "selector" {
  count = var.enabled ? 1 : 0

  special = false
  length  = 8
}

#####
# RBAC
#####

resource "kubernetes_service_account" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.service_account_name
    namespace = var.namespace
    labels = merge(
      {
        instance  = var.service_account_name
        component = "rbac"
      },
      local.labels,
      var.labels,
      var.service_account_labels
    )
    annotations = merge(
      {},
      local.annotations,
      var.annotations,
      var.service_account_annotations
    )
  }
}

resource "kubernetes_cluster_role" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name = var.cluster_role_name
    labels = merge(
      {
        instance  = var.cluster_role_name
        component = "rbac"
      },
      local.labels,
      var.labels,
      var.cluster_role_labels
    )
    annotations = merge(
      {},
      local.annotations,
      var.annotations,
      var.cluster_role_annotations
    )
  }

  rule {
    api_groups = [""]
    resources  = ["events", "endpoints"]
    verbs      = ["create", "patch"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods/eviction"]
    verbs      = ["create"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods/status"]
    verbs      = ["update"]
  }

  rule {
    api_groups     = [""]
    resources      = ["endpoints"]
    resource_names = ["cluster-autoscaler"]
    verbs          = ["get", "update"]
  }

  rule {
    api_groups = [""]
    resources  = ["nodes"]
    verbs      = ["watch", "list", "get", "update"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "replicationcontrollers", "persistentvolumeclaims", "persistentvolumes"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["extensions"]
    resources  = ["replicasets", "daemonsets"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["policy"]
    resources  = ["poddisruptionbudgets"]
    verbs      = ["watch", "list"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["statefulsets", "replicasets", "daemonsets"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["storage.k8s.io"]
    resources  = ["storageclasses", "csinodes"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["batch", "extensions"]
    resources  = ["jobs"]
    verbs      = ["get", "list", "watch", "patch"]
  }

  rule {
    api_groups = ["coordination.k8s.io"]
    resources  = ["leases"]
    verbs      = ["create"]
  }

  rule {
    api_groups     = ["coordination.k8s.io"]
    resources      = ["leases"]
    resource_names = ["cluster-autoscaler"]
    verbs          = ["get", "update"]
  }
}

resource "kubernetes_role" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.role_name
    namespace = var.namespace
    labels = merge(
      {
        instance  = var.role_name
        component = "rbac"
      },
      local.labels,
      var.labels,
      var.role_labels
    )
    annotations = merge(
      {},
      local.annotations,
      var.annotations,
      var.role_annotations
    )
  }

  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    verbs      = ["create", "list", "watch"]
  }

  rule {
    api_groups     = [""]
    resources      = ["configmaps"]
    resource_names = ["cluster-autoscaler-status", "cluster-autoscaler-priority-expander"]
    verbs          = ["delete", "get", "update", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name = var.cluster_role_binding_name
    labels = merge(
      {
        instance  = var.cluster_role_binding_name
        component = "rbac"
      },
      local.labels,
      var.labels,
      var.cluster_role_binding_labels
    )
    annotations = merge(
      {},
      local.annotations,
      var.annotations,
      var.cluster_role_binding_annotations
    )
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = element(concat(kubernetes_cluster_role.this.*.metadata.0.name, list("")), 0)
  }

  subject {
    kind      = "ServiceAccount"
    name      = element(concat(kubernetes_service_account.this.*.metadata.0.name, list("")), 0)
    namespace = element(concat(kubernetes_service_account.this.*.metadata.0.namespace, list("")), 0)
  }
}

resource "kubernetes_role_binding" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.role_binding_name
    namespace = var.namespace
    labels = merge(
      {
        instance  = var.role_binding_name
        component = "rbac"
      },
      local.labels,
      var.labels,
      var.role_binding_labels
    )
    annotations = merge(
      {},
      local.annotations,
      var.annotations,
      var.role_binding_annotations
    )
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = element(concat(kubernetes_role.this.*.metadata.0.name, list("")), 0)
  }

  subject {
    kind      = "ServiceAccount"
    name      = element(concat(kubernetes_service_account.this.*.metadata.0.name, list("")), 0)
    namespace = element(concat(kubernetes_service_account.this.*.metadata.0.namespace, list("")), 0)
  }
}

#####
# Deployment
#####

resource "kubernetes_deployment" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.deployment_name
    namespace = var.namespace
    labels = merge(
      {
        instance  = var.deployment_name
        component = "application"
      },
      local.labels,
      var.labels,
      var.deployment_labels
    )
    annotations = merge(
      {},
      local.annotations,
      var.annotations,
      var.deployment_annotations
    )
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        selector = "cluster-autoscaler-${element(concat(random_string.selector.*.result, list("")), 0)}"
      }
    }

    template {
      metadata {
        labels = merge(
          {
            instance  = var.deployment_name
            component = "application"
          },
          local.labels,
          var.labels,
          var.deployment_template_labels,
          {
            selector = "cluster-autoscaler-${element(concat(random_string.selector.*.result, list("")), 0)}"
          }
        )
        annotations = merge(
          {
            "prometheus.io/scrape" = "false"
            "prometheus.io/port"   = local.port
          },
          local.annotations,
          var.annotations,
          var.deployment_template_annotations
        )
      }

      spec {
        service_account_name            = element(concat(kubernetes_service_account.this.*.metadata.0.name, list("")), 0)
        automount_service_account_token = true

        container {
          image             = "${var.image}:${var.image_version}"
          name              = "cluster-autoscaler"
          image_pull_policy = "Always"

          command = var.command
          args    = var.arguments

          resources {
            limits {
              cpu    = "100m"
              memory = "300Mi"
            }
            requests {
              cpu    = "100m"
              memory = "300Mi"
            }
          }

          volume_mount {
            name       = "ssl-certs"
            mount_path = "/etc/ssl/certs/ca-certificates.crt"
            read_only  = true
          }
        }

        volume {
          name = "ssl-certs"
          host_path {
            path = var.ca_certificates_path
          }
        }
      }
    }
  }
}
