variable "project_id" {
  type = string
}
variable "region" {
  type = string
}
variable "network_name" {
  type = string
}

variable "prod_cidr" {
  type = string
}
variable "stage_cidr" {
  type = string
}
variable "dev_cidr" {
  type = string
}

variable "zonea" { type = string }
variable "zoneb" { type = string }
variable "zonec" { type = string }

variable "prod_pod_subnet" { type = string }
variable "prod_svc_subnet" { type = string }
variable "prod_net_name" { type = string }
variable "stage_net_name" { type = string }
variable "dev_net_name" { type = string }
