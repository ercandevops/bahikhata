variable "resource_groups" {
  type = map(object({
    rg_name  = string
    rg_location = string
  }))
}