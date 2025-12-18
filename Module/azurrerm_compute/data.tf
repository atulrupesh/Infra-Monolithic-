data "azurerm_subnet" "subnet" {
    for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vartual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "ip" {
    for_each = var.vms
  name                = each.value.pubic_IP_Name
  resource_group_name = each.value.resource_group_name
}