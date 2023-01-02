variable "project_id" { 
  type = string 
  description = "ID of the host project"
}
variable "prod_project_name" { 
  type = string 
  description = "Name of the service project to enable"
}
variable "stage_project_name" { 
  type = string 
  description = "Name of the service project to enable"
}


variable "region" { type = string }


# Network
variable "prod_net_name" { type = string }
variable "stage_net_name" { type = string }
# variable "dev_net_name" { type = string }