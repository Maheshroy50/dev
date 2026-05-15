terraform {
  backend "s3" {
    bucket         = "mahesh-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    

  }
}
