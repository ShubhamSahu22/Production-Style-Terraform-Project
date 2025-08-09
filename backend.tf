terraform {
  backend "s3" {
    bucket = "terraform-remote-state-shubham"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
