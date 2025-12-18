variable "vms" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))

    vm_name              = string
    vm_size              = string
    subnet_name          = string
    vartual_network_name = string
    pubic_IP_Name=string
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    storage_os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })

    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
    })


  }))



}
