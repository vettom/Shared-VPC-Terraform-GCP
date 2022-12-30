
# Activate var.host_project_id as host project
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project_id
}


# Below example of creating service project and sharing "prod-k8s-network" subnet with service project. Additional users are given access to shared subnet.
module "prod-project" {
  source = "./modules/Service_Project"
  service_project_name = "project-prod-372411"
  region = "us-west1"
  subnets_to_share = ["prod-k8s-network", ]
  enable_k8s = true
  additional_service_users = ["user:prod@vettom.uk",
            "serviceAccount:terraform-proj-project@project-prod-372411.iam.gserviceaccount.com",
            ]   
  host_project = google_compute_shared_vpc_host_project.host.project

}



module "dev-project" {
  source = "./modules/Service_Project"
  service_project_name = "project-dev"
  region = "us-west1"
  subnets_to_share = ["prod-k8s-network", ]
  enable_k8s = true
  additional_service_users = ["user:prod@vettom.uk",
            "serviceAccount:terraform-proj-project@project-prod-372411.iam.gserviceaccount.com",
            ]   
  host_project = google_compute_shared_vpc_host_project.host.project

}

