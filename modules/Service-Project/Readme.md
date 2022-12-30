# Service Project creation

 Purpose of this module is to be able to attach service project and share specific subnets with specific service/users only. By default Compute API and Kubernetes API are given permission to service project.

# Required inputs
- service_project_name  	: Name of the service project to be added
- Region 					: Region in which to create
- subnets_to_share      	: List of Host project subnets to be shared
- enable_k8s				: true/false for k8s resources
- additional_service_users 	: Additional custom created user/service accounts requiring access.

# Usage
```bash
module "<service project name>" {
  source = "<${PATH>}/Service_Project"
  service_project_name = "<Name of project to add"
  region = "us-west1"
  subnet_to_share = ["<Name of subnet in Host project", ]
  enable_k8s = true|false
  additional_service_users = ["user:admin@example.uk",
            "serviceAccount:terraform@example-372411.iam.gserviceaccount.com",
            ]   
  host_project = google_compute_shared_vpc_host_project.host.project
}
```