terraform {
  backend "s3" {
    bucket         = "heet-s3-bucket"   # Replace with your S3 bucket
    key            = "ec2-docker-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "launchpad-table" # Replace with your DynamoDB table
  }
}

