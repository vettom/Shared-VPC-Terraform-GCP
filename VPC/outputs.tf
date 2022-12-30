output "netname" {
  value = module.network.network_name
}

output "project_number" {
  value = data.google_project.project
}
