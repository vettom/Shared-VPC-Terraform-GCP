variable "service_project_name" { type = string }
variable "host_project" { type = string }
variable "region" { type = string }
variable "subnets_to_share" { type = set(string) }
variable "additional_service_users" { type = list(string) }
variable "enable_k8s" { type = bool }

locals { 
compute_users = ["serviceAccount:${data.google_project.service_project_id.number}-compute@developer.gserviceaccount.com",
            "serviceAccount:${data.google_project.service_project_id.number}@cloudservices.gserviceaccount.com",
            ]
}
locals { 
k8s_users = ["serviceAccount:${data.google_project.service_project_id.number}-compute@developer.gserviceaccount.com",
            "serviceAccount:${data.google_project.service_project_id.number}@cloudservices.gserviceaccount.com",
            "serviceAccount:service-${data.google_project.service_project_id.number}@container-engine-robot.iam.gserviceaccount.com",]
}

locals {
  all_compute_users = concat(local.compute_users, var.additional_service_users)
}
locals {
  all_k8s_users = concat(local.k8s_users, var.additional_service_users)
}