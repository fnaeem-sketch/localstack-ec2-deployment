# # # store state file in an s3 bucket 
# terraform {
#   backend "s3" {
#     bucket                      = "terraform-state-bucket"
#     key                         = "terraform.tfstate"
#     region                      = "us-east-1"
#     endpoint                    = "http://localhost:4566"
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     force_path_style            = true
#   }
# }