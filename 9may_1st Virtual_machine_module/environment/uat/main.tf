module "module_rg" {
  source = "../../resource/1.resource_group"

  rgs = var.rgs
}

module "module_vnet" {
    depends_on = [module.module_rg]
  source = "../../resource/2.vnet"

  vnets = var.vnets
}
module "module_subnet" {
    depends_on = [module.module_vnet]
  source = "../../resource/3.subnet"

  subnets = var.subnets
}

module "module_public_ip" {
    depends_on = [module.module_rg]
  source = "../../resource/4.public_ip"

  public_ips = var.public_ips
}
module "module_nic" {
    depends_on = [module.module_subnet, module.module_public_ip]
  source = "../../resource/5.virtual_machine"

  nics = var.nics
}
module "module_nsg" {
    depends_on = [module.module_rg]
  source = "../../resource/6.nsg"

  nsgs = var.nsgs
}

module "module_nsg_subnet_association" {
    depends_on = [module.module_nsg, module.module_subnet]
  source = "../../resource/7.nsg_subnet_association"

  subnet_nsg_association = var.subnet_nsg_association
}