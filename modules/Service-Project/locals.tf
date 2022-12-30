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