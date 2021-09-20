#####
# Global
#####

variable "annotations" {
  description = "Map of annotations to apply on all kubernetes resources."
  default     = {}
}

variable "enabled" {
  description = "Whether or not the module is enabled."
  default     = true
}

variable "labels" {
  description = "Map of labels to apply on all kubernetes resources."
  default     = {}
}

variable "namespace" {
  description = "Name of the namespace in which to deploy the module."
  default     = "kube-system"
}


#####
# RBAC
#####

variable "cluster_role_name" {
  description = "Name of the cluster role that is created."
  default     = "cluster-autoscaler"
}

variable "cluster_role_labels" {
  description = "Map of labels to apply on the cluster role."
  default     = {}
}

variable "cluster_role_annotations" {
  description = "Map of annotations to apply on the cluster role."
  default     = {}
}

variable "cluster_role_binding_name" {
  description = "Name of the cluster role binding that is created."
  default     = "cluster-autoscaler"
}

variable "cluster_role_binding_labels" {
  description = "Map of labels to apply on the cluster role binding."
  default     = {}
}

variable "cluster_role_binding_annotations" {
  description = "Map of annotations to apply on the cluster role binding."
  default     = {}
}

variable "role_name" {
  description = "Name of the role that is created."
  default     = "cluster-autoscaler"
}

variable "role_labels" {
  description = "Map of labels to apply on the role."
  default     = {}
}

variable "role_annotations" {
  description = "Map of annotations to apply on the role."
  default     = {}
}

variable "role_binding_name" {
  description = "Name of the role bindingthat is created."
  default     = "cluster-autoscaler"
}

variable "role_binding_labels" {
  description = "Map of labels to apply on the role binding."
  default     = {}
}

variable "role_binding_annotations" {
  description = "Map of annotations to apply on the role binding."
  default     = {}
}

variable "service_account_name" {
  description = "Name of the service account that is created."
  default     = "cluster-autoscaler"
}

variable "service_account_labels" {
  description = "Map of labels to apply on the service account."
  default     = {}
}

variable "service_account_annotations" {
  description = "Map of annotations to apply on the service account."
  default     = {}
}


#####
# Deployment
#####

variable "deployment_name" {
  description = "Name of the deployment that is created."
  default     = "cluster-autoscaler"
}

variable "deployment_labels" {
  description = "Map of labels that will be applied on the deployment."
  default     = {}
}

variable "deployment_annotations" {
  description = "Map of annotations that will be applied on the annotation."
  default     = {}
}

variable "deployment_template_labels" {
  description = "Map of labels that will be applied on the deployment template."
  default     = {}
}

variable "deployment_template_annotations" {
  description = "Map of annotations that will be applied on the deployment template."
  default     = {}
}


#####
# Application
#####

variable "command" {
  description = "List of commands to pass to the container."
  default     = ["./cluster-autoscaler"]
}

variable "arguments" {
  description = "List of arguments to pass to the application. More information: https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler"
  type        = list(string)
}

variable "image" {
  description = "Docker image to use for the cluster-autoscaler."
  default     = "k8s.gcr.io/cluster-autoscaler"
}

variable "image_version" {
  description = "Docker image tag to use for the cluster-autoscaler."
  type        = string
}

variable "ca_certificates_path" {
  description = "Absolute path of the ca-certificates.crt or ca-bundle.crt on the host machine."
  default     = "/etc/ssl/certs/ca-certificates.crt"
}

variable "envs" {
  description = "Map of string representing environment variables defined in the application container."
  type        = map(string)
  default     = {}
}
