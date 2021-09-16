terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=2.70.0"
    }
  }
}


provider "azurerm" {
  features {}
}


provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.k8s.kube_config.0.host

  client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
}


# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}


# Creating random string for use in DNS Labels and Storage Account
resource "random_id" "randomId" {
  keepers = {
      resource_group = var.resource_group_name
  }
  byte_length = 2
}

