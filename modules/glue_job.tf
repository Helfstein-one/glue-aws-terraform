resource "aws_glue_job" "glue_job" {
  name              = "poc-glue-job"
  role_arn          = aws_iam_role.glue_service_role.arn
  description       = "Transfer csv from source to bucket"
  glue_version      = "4.0"
  worker_type       = "G.1X"
  timeout           = 5
  max_retries       = 1
  number_of_workers = 2
  command {
    name            = "glueetl"
    python_version  = 3
    script_location = "s3://${aws_s3_bucket.dc-poc-code-bucket-aws-h.id}/script.py"
  }

  default_arguments = {
    "--enable-auto-scaling"             = "true"
    "--enable-continous-cloudwatch-log" = "true"
    "--datalake-formats"                = "delta"
    "--source-path"                     = "s3://${aws_s3_bucket.dc-source-data-bucket-aws-h.id}/" # Specify the source S3 path
    "--destination-path"                = "s3://${aws_s3_bucket.dc-target-data-bucket-aws-h.id}/" # Specify the destination S3 path
    "--job-name"                        = "poc-glue-job"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = "true"
  }
}