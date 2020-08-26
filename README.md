# terraform-module-kubernetes-cluster-autoscaler

Terraform module to deploy the kubernetes cluster autoscaler on kubernetes.

## Usage

This module doesn't configure the autoscaler for a particular cloud provider. Please refer to the [https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler](official documentation) to understand how to use this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| kubernetes | >= 1.10.0 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.10.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotations | Map of annotations to apply on all kubernetes resources. | `map` | `{}` | no |
| arguments | List of arguments to pass to the application. More information: https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler | `list(string)` | n/a | yes |
| ca\_certificates\_path | Absolute path of the ca-certificates.crt or ca-bundle.crt on the host machine. | `string` | `"/etc/ssl/certs/ca-certificates.crt"` | no |
| cluster\_role\_annotations | Map of annotations to apply on the cluster role. | `map` | `{}` | no |
| cluster\_role\_binding\_annotations | Map of annotations to apply on the cluster role binding. | `map` | `{}` | no |
| cluster\_role\_binding\_labels | Map of labels to apply on the cluster role binding. | `map` | `{}` | no |
| cluster\_role\_binding\_name | Name of the cluster role binding that is created. | `string` | `"cluster-autoscaler"` | no |
| cluster\_role\_labels | Map of labels to apply on the cluster role. | `map` | `{}` | no |
| cluster\_role\_name | Name of the cluster role that is created. | `string` | `"cluster-autoscaler"` | no |
| command | List of commands to pass to the container. | `list` | <pre>[<br>  "./cluster-autoscaler"<br>]</pre> | no |
| deployment\_annotations | Map of annotations that will be applied on the annotation. | `map` | `{}` | no |
| deployment\_labels | Map of labels that will be applied on the deployment. | `map` | `{}` | no |
| deployment\_name | Name of the deployment that is created. | `string` | `"cluster-autoscaler"` | no |
| deployment\_template\_annotations | Map of annotations that will be applied on the deployment template. | `map` | `{}` | no |
| deployment\_template\_labels | Map of labels that will be applied on the deployment template. | `map` | `{}` | no |
| enabled | Whether or not the module is enabled. | `bool` | `true` | no |
| envs | Map of string representing environment variables defined in the application container. | `map(string)` | `{}` | no |
| image | Docker image to use for the cluster-autoscaler. | `string` | `"k8s.gcr.io/cluster-autoscaler"` | no |
| image\_version | Docker image tag to use for the cluster-autoscaler. | `string` | n/a | yes |
| labels | Map of labels to apply on all kubernetes resources. | `map` | `{}` | no |
| namespace | Name of the namespace in which to deploy the module. | `string` | `"kube-system"` | no |
| role\_annotations | Map of annotations to apply on the role. | `map` | `{}` | no |
| role\_binding\_annotations | Map of annotations to apply on the role binding. | `map` | `{}` | no |
| role\_binding\_labels | Map of labels to apply on the role binding. | `map` | `{}` | no |
| role\_binding\_name | Name of the role bindingthat is created. | `string` | `"cluster-autoscaler"` | no |
| role\_labels | Map of labels to apply on the role. | `map` | `{}` | no |
| role\_name | Name of the role that is created. | `string` | `"cluster-autoscaler"` | no |
| service\_account\_annotations | Map of annotations to apply on the service account. | `map` | `{}` | no |
| service\_account\_labels | Map of labels to apply on the service account. | `map` | `{}` | no |
| service\_account\_name | Name of the service account that is created. | `string` | `"cluster-autoscaler"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_role | n/a |
| cluster\_role\_binding | n/a |
| deployment | n/a |
| eviction\_annotation\_key | Annotation key to use that can be set on a kubernetes resource to avoid the pod from being evicted due to autoscaling. |
| role | n/a |
| role\_binding | n/a |
| service\_account | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning
This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks
This repository uses [pre-commit](https://pre-commit.com/) hooks.
