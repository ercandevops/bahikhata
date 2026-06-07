variable "resource_names" {
    type = map(object({         
        rg_name = string 
        rg_location = string
    }))
}
