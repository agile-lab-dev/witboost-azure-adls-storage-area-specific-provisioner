terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "{{ .Values.state.resource_group_name }}"
    storage_account_name = "{{ .Values.state.storage_account_name }}"
    container_name       = "{{ .Values.state.container_name }}"
    # key is dynamically injected by the Terraform SP
  }
}

provider "azurerm" {
  features {}
}
