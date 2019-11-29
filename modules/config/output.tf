output "apache_fqdn" {
  value = azurerm_public_ip.nginx.fqdn
}

output "jenkins_fqdn" {
  value = azurerm_public_ip.jenkins.fqdn
}
