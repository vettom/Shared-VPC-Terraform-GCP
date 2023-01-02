#  Check VPC module   https://github.com/terraform-google-modules

module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "6.0.0"
  project_id   = var.project_id
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

    stage-k8s-network = [
      {
        range_name    = "stage-pod-net-01"
        ip_cidr_range = var.stage_pod_subnet
      },
      {
        range_name    = "stage-network-service-01"
        ip_cidr_range = var.stage_svc_subnet
      },
      

      ]
  }


}



