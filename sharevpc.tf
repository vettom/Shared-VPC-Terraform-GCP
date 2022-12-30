
# Activate var.host_project_id as host project
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project_id
}


module "vm-project" {
  source = "./SP"
  service_project_name = "project-prod-372411"
  region = "us-west1"
  subnets_to_share = ["prod-k8s-network", ]
  enable_k8s = true
  additional_service_users = ["user:prod@vettom.uk",
            "serviceAccount:terraform-proj-project@project-prod-372411.iam.gserviceaccount.com",
            ]   
  host_project = google_compute_shared_vpc_host_project.host.project

}

module "vm-project-vm" {
  source = "./SP"
  service_project_name = "vm-project-373113"
  region = "us-west1"
  subnets_to_share = ["stage-k8s-network", ]
  enable_k8s = false
  additional_service_users = ["user:vm-owner@vettom.uk","serviceAccount:vmproj-terraform@vm-project-373113.iam.gserviceaccount.com",
            ]   
  host_project = google_compute_shared_vpc_host_project.host.project

}