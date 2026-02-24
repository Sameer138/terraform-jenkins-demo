provider "aws" {
  region = "ap-south-1"
  AWS_SECRET_ACCESS_KEY = "AKIAVAUKT66Q2FAQYQZ3"
  AWS_SECRET_ACCESS_KEY = "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"
}

resource "aws_s3_bucket" "demo" {
  bucket = "sameer-jenkins-demo-bucket-12345"
}
#add something
