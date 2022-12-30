module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "6.0.0"
  project_id   = data.google_project.project.name
  network_name = var.network_name
  routing_mode = "GLOBAL"
  # shared_vpc_host = "true"



  subnets = [
    {
      subnet_name           = var.prod_net_name
      subnet_ip             = var.prod_cidr
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name   = var.stage_net_name
      subnet_ip     = var.stage_cidr
      subnet_region = var.region
      subnet_private_access = "true"
      # subnet_flow_logs      = "true"
      description = "This subnet has a description"
    },
    {
      subnet_name   = var.dev_net_name
      subnet_ip     = var.dev_cidr
      subnet_region = var.region
      subnet_private_access = "true"
      # subnet_flow_logs      = "true"
      # subnet_flow_logs          = "true"
      # subnet_flow_logs_interval = "INTERVAL_10_MIN"
      # subnet_flow_logs_sampling = 0.7
      # subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    }
  ]

  secondary_ranges = {
    prod-k8s-network = [
      {
        range_name    = "prod-pod-net-01"
        ip_cidr_range = var.prod_pod_subnet
      },
      {
        range_name    = "prod-network-service-01"
        ip_cidr_range = var.prod_svc_subnet
      },
    ]

    subnet-02 = []
  }


}



