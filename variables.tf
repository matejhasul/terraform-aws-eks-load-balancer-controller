variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled"
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster"
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account"
}

variable "helm_chart_name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "Helm chart name to be installed"
}

variable "helm_chart_version" {
  type        = string
  default     = "1.12.0"
  description = "Version of the Helm chart"
}

variable "helm_release_name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "Helm release name"
}
variable "helm_repo_url" {
  type        = string
  default     = "https://aws.github.io/eks-charts"
  description = "Helm repository"
}

variable "namespace" {
  type        = string
  default     = "aws-lb-controller"
  description = "The K8s namespace in which the aws-load-balancer-controller service account has been created"
}

variable "service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create Service Account"
}

variable "service_account_name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "The k8s aws-loab-balancer-controller service account name"
}

variable "eks_pod_identity_role_create" {
  type        = bool
  default     = false
  description = "Determines whether to enable support for the EKS pod identity"
}

variable "eks_pod_identity_role_name_prefix" {
  type        = string
  default     = "lb-controller-pod-identity"
  description = "The EKS pod identity role name prefix for LB controller"
}

variable "eks_pod_identity_policy_enabled" {
  type        = bool
  default     = true
  description = "Whether to create opinionated policy for LB controller, see https://github.com/kubernetes-sigs/aws-load-balancer-controller/blob/v2.4.0/docs/install/iam_policy.json"
}

variable "eks_pod_identity_tags" {
  type        = map(string)
  default     = {}
  description = "The EKS Pod identity resources tags"
}

variable "irsa_role_create" {
  type        = bool
  default     = true
  description = "Whether to create IRSA role and annotate service account"
}

variable "irsa_role_name_prefix" {
  type        = string
  default     = "lb-controller-irsa"
  description = "The IRSA role name prefix for LB controller"
}

variable "irsa_policy_enabled" {
  type        = bool
  default     = true
  description = "Whether to create opinionated policy for LB controller, see https://github.com/kubernetes-sigs/aws-load-balancer-controller/blob/v2.4.0/docs/install/iam_policy.json"
}

variable "irsa_tags" {
  type        = map(string)
  default     = {}
  description = "IRSA resources tags"
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://github.com/aws/eks-charts/tree/master/stable/aws-load-balancer-controller"
}

variable "values" {
  type        = string
  default     = ""
  description = "Additional yaml encoded values which will be passed to the Helm chart, see https://github.com/aws/eks-charts/tree/master/stable/aws-load-balancer-controller"
}

variable "argo_enabled" {
  type        = bool
  default     = false
  description = "If set to true, the module will be deployed as ArgoCD application, otherwise it will be deployed as a Helm release"
}

variable "argo_namespace" {
  type        = string
  default     = "argo"
  description = "Namespace to deploy ArgoCD application CRD to"
}

variable "argo_destination_server" {
  type        = string
  default     = "https://kubernetes.default.svc"
  description = "Destination server for ArgoCD Application"
}

variable "argo_project" {
  type        = string
  default     = "default"
  description = "ArgoCD Application project"
}

variable "argo_info" {
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    {
      "name"  = "terraform"
      "value" = "true"
    }
  ]
  description = "ArgoCD info manifest parameter"
}

variable "argo_sync_policy" {
  type        = any
  default     = {}
  description = "ArgoCD syncPolicy manifest parameter"
}

variable "argo_metadata" {
  type = any
  default = {
    "finalizers" : [
      "resources-finalizer.argocd.argoproj.io"
    ]
  }
  description = "ArgoCD Application metadata configuration. Override or create additional metadata parameters"
}

variable "argo_spec" {
  type        = any
  default     = {}
  description = "ArgoCD Application spec configuration. Override or create additional spec parameters"
}

variable "argo_apiversion" {
  type        = string
  default     = "argoproj.io/v1alpha1"
  description = "ArgoCD Appliction apiVersion"
}

variable "argo_kubernetes_manifest_computed_fields" {
  type        = list(string)
  default     = ["metadata.labels", "metadata.annotations"]
  description = "List of paths of fields to be handled as \"computed\". The user-configured value for the field will be overridden by any different value returned by the API after apply."
}

variable "argo_kubernetes_manifest_field_manager_name" {
  type        = string
  default     = "Terraform"
  description = "The name of the field manager to use when applying the kubernetes manifest resource. Defaults to Terraform"
}

variable "argo_kubernetes_manifest_field_manager_force_conflicts" {
  type        = bool
  default     = false
  description = "Forcibly override any field manager conflicts when applying the kubernetes manifest resource"
}

variable "argo_kubernetes_manifest_wait_fields" {
  type        = map(string)
  default     = {}
  description = "A map of fields and a corresponding regular expression with a pattern to wait for. The provider will wait until the field matches the regular expression. Use * for any value."
}

variable "argo_helm_enabled" {
  type        = bool
  default     = false
  description = "If set to true, the ArgoCD Application manifest will be deployed using Kubernetes provider as a Helm release. Otherwise it'll be deployed as a Kubernetes manifest. See Readme for more info"
}

variable "argo_helm_values" {
  type        = string
  default     = ""
  description = "Value overrides to use when deploying argo application object with helm"
}

variable "helm_enabled" {
  type        = bool
  default     = true
  description = "Determines if the helm chart should be installed"
}

variable "helm_create_namespace" {
  type        = bool
  default     = true
  description = "Create the namespace if it does not yet exist"
}

variable "helm_repo_key_file" {
  type        = string
  default     = ""
  description = "Helm repositories cert key file"
}

variable "helm_repo_cert_file" {
  type        = string
  default     = ""
  description = "Helm repositories cert file"
}

variable "helm_repo_ca_file" {
  type        = string
  default     = ""
  description = "Helm repositories cert file"
}

variable "helm_repo_username" {
  type        = string
  default     = ""
  description = "Username for HTTP basic authentication against the helm repository"
}

variable "helm_repo_password" {
  type        = string
  default     = ""
  description = "Password for HTTP basic authentication against the helm repository"
}

variable "helm_devel" {
  type        = bool
  default     = false
  description = "Use helm chart development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored"
}

variable "helm_package_verify" {
  type        = bool
  default     = false
  description = "Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart"
}

variable "helm_keyring" {
  type        = string
  default     = "~/.gnupg/pubring.gpg"
  description = "Location of public keys used for verification. Used only if helm_package_verify is true"
}

variable "helm_timeout" {
  type        = number
  default     = 300
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks)"
}

variable "helm_disable_webhooks" {
  type        = bool
  default     = false
  description = "Prevent helm chart hooks from running"
}

variable "helm_reset_values" {
  type        = bool
  default     = false
  description = "When upgrading, reset the values to the ones built into the helm chart"
}

variable "helm_reuse_values" {
  type        = bool
  default     = false
  description = "When upgrading, reuse the last helm release's values and merge in any overrides. If 'helm_reset_values' is specified, this is ignored"
}

variable "helm_force_update" {
  type        = bool
  default     = false
  description = "Force helm resource update through delete/recreate if needed"
}

variable "helm_recreate_pods" {
  type        = bool
  default     = false
  description = "Perform pods restart during helm upgrade/rollback"
}

variable "helm_cleanup_on_fail" {
  type        = bool
  default     = false
  description = "Allow deletion of new resources created in this helm upgrade when upgrade fails"
}

variable "helm_release_max_history" {
  type        = number
  default     = 0
  description = "Maximum number of release versions stored per release"
}

variable "helm_atomic" {
  type        = bool
  default     = false
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used"
}

variable "helm_wait" {
  type        = bool
  default     = false
  description = "Will wait until all helm release resources are in a ready state before marking the release as successful. It will wait for as long as timeout"
}

variable "helm_wait_for_jobs" {
  type        = bool
  default     = false
  description = "If wait is enabled, will wait until all helm Jobs have been completed before marking the release as successful. It will wait for as long as timeout"
}


variable "helm_skip_crds" {
  type        = bool
  default     = false
  description = "If set, no CRDs will be installed before helm release"
}

variable "helm_render_subchart_notes" {
  type        = bool
  default     = true
  description = "If set, render helm subchart notes along with the parent"
}

variable "helm_disable_openapi_validation" {
  type        = bool
  default     = false
  description = "If set, the installation process will not validate rendered helm templates against the Kubernetes OpenAPI Schema"
}

variable "helm_set_sensitive" {
  type        = map(any)
  default     = {}
  description = "Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff"
}

variable "helm_dependency_update" {
  type        = bool
  default     = false
  description = "Runs helm dependency update before installing the chart"
}

variable "helm_replace" {
  type        = bool
  default     = false
  description = "Re-use the given name of helm release, only if that name is a deleted release which remains in the history. This is unsafe in production"
}

variable "helm_description" {
  type        = string
  default     = ""
  description = "Set helm release description attribute (visible in the history)"
}

variable "helm_postrender" {
  type        = map(any)
  default     = {}
  description = "Value block with a path to a binary file to run after helm renders the manifest which can alter the manifest contents"
}

variable "helm_lint" {
  type        = bool
  default     = false
  description = "Run the helm chart linter during the plan"
}

variable "aws_partition" {
  type        = string
  default     = "aws"
  description = "AWS partition in which the resources are located. Available values are `aws`, `aws-cn`, `aws-us-gov`"
}
