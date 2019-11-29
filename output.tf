output "nginx_name" {
  value = module.config.apache_fqdn
}

output "jenkins" {
  value = module.config.jenkins_fqdn
}

