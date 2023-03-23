
# Activate var.project_id as host project
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.project_id
}


# Below example of creating service project and sharing "prod-k8s-network" subnet with service project. 
# Additional users are given access to shared subnet.
module "prod-project" {
  # source = "/Users/denny.vettom/Git/atlantis/modules/gcp/service-project"
  source = "../service-project"
  service_project_name = var.prod_project_name
  region = var.region
  subnets_to_share = [var.prod_net_name, ]
  additional_service_users = [ "serviceAccount:vettom-automation@master-project-373217.iam.gserviceaccount.com"]   
  host_project = google_compute_shared_vpc_host_project.host.project
  kubernetes_service_agents = true

}


# Below example service project, but no K8s or additional users.
# module "stage-project" {
#   source = "./modules/Service-Project"
#   service_project_name = var.stage_project_name
#   region = var.region
#   subnets_to_share = [var.stage_net_name, ]
#   enable_k8s = false
#   additional_service_users = []   
#   host_project = google_compute_shared_vpc_host_project.host.project

# }

