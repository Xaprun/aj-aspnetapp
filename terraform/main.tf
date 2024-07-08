provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "aks-resource-group"
  location = "eastus"
}

module "aks" {
  source = "git::https://github.com/Xaprun/tfmodules.git/aks_basic?ref=main"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  aks_cluster_name    = "my-aks-cluster"
  node_count          = 2
  node_vm_size        = "Standard_DS2_v2"
}

output "kube_config" {
  value = module.aks.kube_config
}
