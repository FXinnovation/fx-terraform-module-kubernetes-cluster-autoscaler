output "deployment" {
  value = element(concat(kubernetes_deployment.this, [{}]), 0)
}

output "service_account" {
  value = element(concat(kubernetes_service_account.this, [{}]), 0)
}

output "cluster_role" {
  value = element(concat(kubernetes_cluster_role.this, [{}]), 0)
}

output "cluster_role_binding" {
  value = element(concat(kubernetes_cluster_role_binding.this, [{}]), 0)
}

output "role_binding" {
  value = element(concat(kubernetes_role_binding.this, [{}]), 0)
}

output "role" {
  value = element(concat(kubernetes_role.this, [{}]), 0)
}

output "eviction_annotation_key" {
  description = "Annotation key to use that can be set on a kubernetes resource to avoid the pod from being evicted due to autoscaling."
  value       = "cluster-autoscaler.kubernetes.io/safe-to-evict"
}
