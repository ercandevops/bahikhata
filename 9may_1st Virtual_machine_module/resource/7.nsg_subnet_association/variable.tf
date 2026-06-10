variable "subnet_nsg_association" {

  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
    nsg_name            = string
  }))
}