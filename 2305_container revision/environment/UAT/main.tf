# module "resource_creation" {
#     source = "../../resources/1.resource_group"
#     rgs = var.rgs
# }

# module "storage_creation" {
#     depends_on = [module.resource_creation]
#     source = "../../resources/3.storage"
#     stg = var.stg
# }

# module "container_creation" {
#     depends_on = [module.storage_creation]
#     source = "../../resources/2.container"
#     ccnt = var.ccnt
# }
