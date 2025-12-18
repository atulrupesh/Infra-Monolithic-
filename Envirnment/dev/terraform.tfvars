rgs = {
  rg01 = {
    name     = "Dev-RG"
    location = "West Europe"
  }
}

storages = {
  stg01 = {
    name                     = "devstorageahvuv"
    resource_group_name      = "Dev-RG"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

public_ip = {
  ip01 = {
    name                = "Dev-Public-ip"
    resource_group_name = "Dev-RG"
    location            = "West Europe"
    allocation_method   = "Static"
  }
}

vartal_Networks = {
  vnet01 = {
    name                = "Dev-vnet"
    location            = "West Europe"
    resource_group_name = "Dev-RG"
    address_space       = ["10.0.0.0/16"]

    subnets = {
      subnet01 = {
        name             = "Dev-Subnet-fronted"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet02 = {
        name             = "Dev-Subnet-backend"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

key_vault = {
  vault01 = {
    name                        = "devkeyvaucscbcs"
    location                    = "West Europe"
    resource_group_name         = "Dev-RG"
    enabled_for_disk_encryption = "true"
    soft_delete_retention_days  = "7"
    purge_protection_enabled    = "false"

    sku_name = "standard"

  }
}

vms = {
  vm01 = {
    nic_name             = "Dev-NIC"
    location             = "West Europe"
    resource_group_name  = "Dev-RG"
    vm_name              = "Dev-VM-Fronted"
    vm_size              = "Standard_B2s"
    subnet_name          = "Dev-Subnet-fronted"
    pubic_IP_Name        = "Dev-Public-ip"
    vartual_network_name = "Dev-vnet"
    ip_configurations = {
      ip010 = {
        name                          = "dev-ip-configuration"
        private_ip_address_allocation = "Dynamic"
      }

    }

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "Devosdisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "Dev-host"
      admin_username = "testadmin"
      admin_password = "Password1234!"
    }



  }
}

sql-server = {
  sql01 = {
    name                         = "sqbhuihjndserefh"
    resource_group_name          = "Dev-RG"
    location                     = "eastus2"
    version                      = "12.0"
    administrator_login          = "sqladministrator"
    administrator_login_password = "thisIsKat11"
    minimum_tls_version          = "1.2"
  }
}

sql_data = {
  sqldata01 = {
    name                = "fsfggwddata"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
    sql_server_name     = "sqbhuihjndserefh"
    resource_group_name = "Dev-RG"
  }
}

nsg = {
  nsg_01 = {
    name                = "nsg01"
    location            = "West Europe"
    resource_group_name = "Dev-RG"
  
  security_rules = {
    rule01 = {
      name                       = "test123"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
}