# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "tosin-terraform-remote-state"
    key            = "rentzone-ecs/terraform.tfstate" # name for the folder to be stored in the bucket with file name
    region         = "us-east-1"
    profile        = "terraform-user"
    dynamodb_table = "terraform-state-lock"
  }
}