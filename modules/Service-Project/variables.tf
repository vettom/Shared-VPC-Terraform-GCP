variable "service_project_name" { type = string }
variable "host_project" { type = string }
variable "region" { type = string }
variable "subnets_to_share" { type = set(string) }
variable "additional_service_users" { type = list(string) }
variable "enable_k8s" { type = bool }
