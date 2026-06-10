variable "rgs" {
    type = map(object({
  name     = string
  location = string
}))
}


variable "vnets" {
    type = map(object({
  name                = string
  address_space       = list(string)
  location            = string
  resource_group_name = string
}))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "public_ips" {
    type = map(object({
  name                = string
  resource_group_name = string
  location            = string
  allocation_method   = string
  sku                 = string
}))
}

variable "nics" {
  type        = map(object({
    name                                = string
    location                            = string
    resource_group_name                 = string
    subnet_name                         = string
    virtual_network_name                = string
    public_ip_name                      = string
    ip_configuration_name               = string
    private_ip_address_allocation       = string
    virtual_machine_name                = string
    size_vm_size                        = string
    admin_username                      = string
    admin_password                      = string
    os_disk_caching                     = string
    os_disk_storage_account_type        = string
    source_image_publisher              = string
    source_image_offer                  = string
    source_image_sku                    = string
    source_image_version                = string
  }))
 
}

variable "nsgs" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    security_rule_name         = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "subnet_nsg_association" {

  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
    nsg_name            = string
  }))
}