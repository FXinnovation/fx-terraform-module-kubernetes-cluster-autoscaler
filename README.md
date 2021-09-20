# terraform-module-kubernetes-cluster-autoscaler

Terraform module to deploy the kubernetes cluster autoscaler on kubernetes.

## Usage

This module doesn't configure the autoscaler for a particular cloud provider. Please refer to the [https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler](official documentation) to understand how to use this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_role.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_service_account.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [random_string.selector](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Map of annotations to apply on all kubernetes resources. | `map` | `{}` | no |
| <a name="input_arguments"></a> [arguments](#input\_arguments) | List of arguments to pass to the application. More information: https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler | `list(string)` | n/a | yes |
| <a name="input_ca_certificates_path"></a> [ca\_certificates\_path](#input\_ca\_certificates\_path) | Absolute path of the ca-certificates.crt or ca-bundle.crt on the host machine. | `string` | `"/etc/ssl/certs/ca-certificates.crt"` | no |
| <a name="input_cluster_role_annotations"></a> [cluster\_role\_annotations](#input\_cluster\_role\_annotations) | Map of annotations to apply on the cluster role. | `map` | `{}` | no |
| <a name="input_cluster_role_binding_annotations"></a> [cluster\_role\_binding\_annotations](#input\_cluster\_role\_binding\_annotations) | Map of annotations to apply on the cluster role binding. | `map` | `{}` | no |
| <a name="input_cluster_role_binding_labels"></a> [cluster\_role\_binding\_labels](#input\_cluster\_role\_binding\_labels) | Map of labels to apply on the cluster role binding. | `map` | `{}` | no |
| <a name="input_cluster_role_binding_name"></a> [cluster\_role\_binding\_name](#input\_cluster\_role\_binding\_name) | Name of the cluster role binding that is created. | `string` | `"cluster-autoscaler"` | no |
| <a name="input_cluster_role_labels"></a> [cluster\_role\_labels](#input\_cluster\_role\_labels) | Map of labels to apply on the cluster role. | `map` | `{}` | no |
| <a name="input_cluster_role_name"></a> [cluster\_role\_name](#input\_cluster\_role\_name) | Name of the cluster role that is created. | `string` | `"cluster-autoscaler"` | no |
| <a name="input_command"></a> [command](#input\_command) | List of commands to pass to the container. | `list` | <pre>[<br>  "./cluster-autoscaler"<br>]</pre> | no |
| <a name="input_deployment_annotations"></a> [deployment\_annotations](#input\_deployment\_annotations) | Map of annotations that will be applied on the annotation. | `map` | `{}` | no |
| <a name="input_deployment_labels"></a> [deployment\_labels](#input\_deployment\_labels) | Map of labels that will be applied on the deployment. | `map` | `{}` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Name of the deployment that is created. | `string` | `"cluster-autoscaler"` | no |
| <a name="input_deployment_template_annotations"></a> [deployment\_template\_annotations](#input\_deployment\_template\_annotations) | Map of annotations that will be applied on the deployment template. | `map` | `{}` | no |
| <a name="input_deployment_template_labels"></a> [deployment\_template\_labels](#input\_deployment\_template\_labels) | Map of labels that will be applied on the deployment template. | `map` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not the module is enabled. | `bool` | `true` | no |
| <a name="input_envs"></a> [envs](#input\_envs) | Map of string representing environment variables defined in the application container. | `map(string)` | `{}` | no |
| <a name="input_image"></a> [image](#input\_image) | Docker image to use for the cluster-autoscaler. | `string` | `"k8s.gcr.io/cluster-autoscaler"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Docker image tag to use for the cluster-autoscaler. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels to apply on all kubernetes resources. | `map` | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the namespace in which to deploy the module. | `string` | `"kube-system"` | no |
| <a name="input_role_annotations"></a> [role\_annotations](#input\_role\_annotations) | Map of annotations to apply on the role. | `map` | `{}` | no |
| <a name="input_role_binding_annotations"></a> [role\_binding\_annotations](#input\_role\_binding\_annotations) | Map of annotations to apply on the role binding. | `map` | `{}` | no |
| <a name="input_role_binding_labels"></a> [role\_binding\_labels](#input\_role\_binding\_labels) | Map of labels to apply on the role binding. | `map` | `{}` | no |
| <a name="input_role_binding_name"></a> [role\_binding\_name](#input\_role\_binding\_name) | Name of the role bindingthat is created. | `string` | `"cluster-autoscaler"` | no |
| <a name="input_role_labels"></a> [role\_labels](#input\_role\_labels) | Map of labels to apply on the role. | `map` | `{}` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the role that is created. | `string` | `"cluster-autoscaler"` | no |
| <a name="input_service_account_annotations"></a> [service\_account\_annotations](#input\_service\_account\_annotations) | Map of annotations to apply on the service account. | `map` | `{}` | no |
| <a name="input_service_account_labels"></a> [service\_account\_labels](#input\_service\_account\_labels) | Map of labels to apply on the service account. | `map` | `{}` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of the service account that is created. | `string` | `"cluster-autoscaler"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_role"></a> [cluster\_role](#output\_cluster\_role) | n/a |
| <a name="output_cluster_role_binding"></a> [cluster\_role\_binding](#output\_cluster\_role\_binding) | n/a |
| <a name="output_deployment"></a> [deployment](#output\_deployment) | n/a |
| <a name="output_eviction_annotation_key"></a> [eviction\_annotation\_key](#output\_eviction\_annotation\_key) | Annotation key to use that can be set on a kubernetes resource to avoid the pod from being evicted due to autoscaling. |
| <a name="output_role"></a> [role](#output\_role) | n/a |
| <a name="output_role_binding"></a> [role\_binding](#output\_role\_binding) | n/a |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning
This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks
This repository uses [pre-commit](https://pre-commit.com/) hooks.
