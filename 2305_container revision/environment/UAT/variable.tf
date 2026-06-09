variable "rgs" {
  type = map(object({
    name = string
    location = string
  }))
  
}

variable "stg" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "ccnt" {
  type = map(object({
    name  = string
    storage_account_name = string
    resource_group_name = string
    container_access_type = string
  }))
}