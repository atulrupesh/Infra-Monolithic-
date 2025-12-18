module "rg" {
  source = "../../Module/azurrerm_resource"
  rgs    = var.rgs
}

module "storage" {
  source     = "../../Module/azurrerm_storage"
  storages   = var.storages
  depends_on = [module.rg]

}

module "Public-IP" {
  source     = "../../Module/azurrerm_public-ip"
  public_ip  = var.public_ip
  depends_on = [module.rg]

}

module "Vartual_network" {
  source          = "../../Module/azurrerm_network"
  vartal_Networks = var.vartal_Networks
  depends_on      = [module.rg]


}

module "keyvaute" {
  source     = "../../Module/azurrerm_keyvault"
  key_vault  = var.key_vault
  depends_on = [module.rg]

}

module "vartual_Machin" {
  source     = "../../Module/azurrerm_compute"
  vms        = var.vms
  depends_on = [module.Vartual_network]

}
module "sqlserver" {
  source = "../../Module/azurrerm_sql_server"
  sql-server = var.sql-server
  depends_on = [module.rg]
}

module "sqldata" {
    source = "../../Module/azurrerm_sql_database"
    sql_data=var.sql_data
    depends_on = [ module.sqlserver  ,module.rg]
  
}

module "nsg_group" {
    source = "../../Module/azurerm_Network_security_Group"
    nsg = var.nsg
    depends_on = [ module.rg  ]
  
}