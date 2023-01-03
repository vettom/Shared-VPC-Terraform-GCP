# GCP Shared VPC using Terraform
Complete shared VPC configuration with Terraform. VPC folder contains code required to configure VPC and subnets if you wish to use.
 
- Create Host Project
- IAM roles required for configuration
- Attach service project
- Share ***Individual subnet*** with service Project


## Pre-requisites
- At least 2 projects exists.
- VPC and subnets created in project that will be Host Project. 
- Billing Account attached to Project
- Enable following API
	- Compute Engine API 
	- Kubernetes Engine API
	- Cloud Resource Manager API (Master and service Proj)


# Preparing environment
- In **Host Project** create service account for automation. 
- Generate authentication key. Here I am creating json format key. 
- Assign *Editor* role to Service account in Host Project
- At ***Organisation*** IAM, add following permission to service account
	- Compute Shared VPC Admin
	- Project IAM Admin


# Required inputs
- host_project_id  			: ID of project to become Host Project
### service project module
- service_project_name  	: Name of the service project to be added
- Region 					: Region in which to create
- subnets_to_share      	: List of Host project subnets to be shared
- enable_k8s				: true/false for k8s resources
- additional_service_users 	: Additional custom created user/service accounts requiring access.

> Add automation user to additional users.

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







