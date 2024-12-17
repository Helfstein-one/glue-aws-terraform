###############################################
# S3 Bucket src data
resource "aws_s3_bucket" "dc-source-data-bucket-aws-h" {
  bucket = "dc-source-data-bucket-aws-h"
}

resource "aws_s3_object" "data-object" {
  bucket = aws_s3_bucket.dc-source-data-bucket-aws-h.bucket
  key    = "organizations.csv"
  source = "~/modules/data/organizations.csv"
}

###############################################
# S3 Bucket for Processed Data target
resource "aws_s3_bucket" "dc-target-data-bucket-aws-h" {
  bucket = "dc-target-data-bucket-aws-h"
}

###############################################
# S3 Bucket for code rest
resource "aws_s3_bucket" "dc-poc-code-bucket-aws-h" {
  bucket = "dc-poc-code-bucket-aws-h"
}

resource "aws_s3_object" "code-data-object" {
  bucket = aws_s3_bucket.dc-poc-code-bucket-aws-h.bucket
  key    = "script.py"
  source = "~/modules/src/script.py"
}