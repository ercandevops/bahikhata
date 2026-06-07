module "rgs" {
    source = "../../resourced/1.resource_group"
    rgs = var.rgs
}

module "stg" {
    depends_on = [module.rgs]
    source = "../../resourced/2.storage_account"
    stg = var.stg
}

module "container" {
    depends_on = [module.stg]
    source = "../../resourced/3.container"
    cont = var.cont
}