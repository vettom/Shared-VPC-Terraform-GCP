# GCP Shared VPC using Terraform
- Activate a project as host project
- Add service project to Host project
- Share specific subnet with attached project

> By default only google created service accounts are provided access.

# Assumptions
- Projects must exist and necessary API (compute and K8s) enabled
- Host Project has VPC with at least one subnet for sharing.

# Required inputs
- host_project_id  			: ID of project to become Host Project
### service project module
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


