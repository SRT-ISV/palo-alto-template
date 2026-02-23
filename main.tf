module "template" {
source = "./modules/template"
tamplate_name         = var.tamplate_name
project_id            = var.project_id
region                = var.region
mgmt_subnet           = var.mgmt_subnet
data_subnet           = var.data_subnet
bucket_name           = var.bucket_name
service_account_email = var.service_account_email
csp_pin_id_secret     = var.csp_pin_id_secret
csp_pin_value_secret  = var.csp_pin_value_secret
csp_authcodes_secret  = var.csp_authcodes_secret
}