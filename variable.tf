variable "ami_type" {
  type        = string
  description = <<-EOT
    Type of Amazon Machine Image (AMI) associated with the EKS Node Group.
    Defaults to `AL2_x86_64`. Valid values: `AL2_x86_64`, `AL2_x86_64_GPU`, and `AL2_ARM_64`.
    EOT
  default     = "AL2_x86_64"
  validation {
    condition = (
      contains(["AL2_x86_64", "AL2_x86_64_GPU", "AL2_ARM_64"], var.ami_type)
    )
    error_message = "Var ami_type must be one of \"AL2_x86_64\", \"AL2_x86_64_GPU\", and \"AL2_ARM_64\"."
  }
}
variable "disk_size" {
  type        = number
  description = <<-EOT
    Disk size in GiB for worker nodes. Defaults to 20. Ignored it `launch_template_id` is supplied.
    Terraform will only perform drift detection if a configuration value is provided.
    EOT
  default     = 20
}
variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = <<-EOT
    Single instance type to use for this node group, passed as a list. Defaults to ["t3.medium"].
    It is a list because Launch Templates take a list, and it is a single type because EKS only supports a single type per node group.
    EOT
  validation {
    condition = (
      length(var.instance_types) == 1
    )
    error_message = "Per the EKS API, only a single instance type value is currently supported."
  }
}
variable "pblc_desired_size" {
    type = number 
    default = 1 
}
variable "pblc_max_size" {
    type = number 
    default = 1 
}
variable "pblc_min_size" {
    type = number 
    default = 1 
}