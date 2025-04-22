resource "aws_s3_bucket" "vpc-demo-s3" {
  provider      = aws.source
  force_destroy = var.force_destroy
  bucket        = format("%s-%s-%s-tf-vpc-demo-s3", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])

  tags = merge(
    var.common_tags,
    { Name = format("%s-%s-%s-tf-vpc-demo-s3", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )
}

resource "aws_s3_bucket_versioning" "vpc-demo-s3" {
  provider   = aws.source
  bucket     = aws_s3_bucket.vpc-demo-s3.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "backup" {
  provider      = aws.backup
  force_destroy = var.force_destroy
  bucket        = format("%s-%s-%s-tf-vpc-demo-s3-backup", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])

  tags = merge(
    var.common_tags,
    { Name = format("%s-%s-%s-tf-vpc-demo-s3-backup", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )
}

resource "aws_s3_bucket_versioning" "backup" {
  provider   = aws.backup
  bucket     = aws_s3_bucket.backup.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "vpc-demo-s3" {
  depends_on = [aws_s3_bucket_versioning.vpc-demo-s3,aws_s3_bucket_versioning.backup]
  provider = aws.source
  bucket   = aws_s3_bucket.vpc-demo-s3.id
  role     = aws_iam_role.replication.arn

  rule {
    id     = "StateReplicationRule"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.backup.arn
      storage_class = "STANDARD"
    }
  }
}