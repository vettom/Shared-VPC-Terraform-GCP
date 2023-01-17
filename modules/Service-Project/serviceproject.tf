

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "service-project" {
  host_project    = var.host_project
  service_project = var.service_project_name
}

data "google_project" "service_project_id" {
  project_id = var.service_project_name
}


# Create rule for system generated accounts
resource "google_compute_subnetwork_iam_binding" "network_users" {
  for_each = var.subnets_to_share
  project    = var.host_project
  region     = var.region
  subnetwork = each.value
  role       = "roles/compute.networkUser"
    members = local.all_compute_users
}


# Kubernetes enabled network permission
resource "google_project_iam_binding" "service_agents" {
  count   = var.enable_k8s ? 1 : 0
  project = var.host_project
  role    = "roles/container.hostServiceAgentUser"
  members = local.all_k8s_users

}

