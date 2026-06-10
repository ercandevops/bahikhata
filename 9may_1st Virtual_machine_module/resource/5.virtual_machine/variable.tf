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