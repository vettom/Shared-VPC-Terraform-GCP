
# Activate var.project_id as host project
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.project_id
}


# Below example of creating service project and sharing "prod-k8s-network" subnet with service project. 
# Additional users are given access to shared subnet.
module "prod-project" {
  source = "./modules/Service-Project"
  service_project_name = var.prod_project_name
  region = var.region
  subnets_to_share = [var.prod_net_name, ]
  enable_k8s = true
  additional_service_users = ["serviceAccount:masterproj-new-automation@master-project-373217.iam.gserviceaccount.com",
            ]   
  host_project = google_compute_shared_vpc_host_project.host.project

}


# Below example service project, but no K8s or additional users.
module "stage-project" {
  source = "./modules/Service-Project"
  service_project_name = var.stage_project_name
  region = var.region
  subnets_to_share = [var.stage_net_name, ]
  enable_k8s = false
  additional_service_users = []   
  host_project = google_compute_shared_vpc_host_project.host.project

}

