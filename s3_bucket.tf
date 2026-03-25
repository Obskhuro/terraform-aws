resource "aws_s3_bucket" "site" {
  bucket        = "bucket-yanis-grousselle"
  force_destroy = true

  tags = {
    Name = "bucket-yanis-grousselle"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id

  depends_on = [aws_s3_bucket_public_access_block.site]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.site.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_versioning" "site" {
  bucket = aws_s3_bucket.site.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_object" "fichier_txt" {
  bucket = aws_s3_bucket.site.id
  key    = "fichier.txt"
  source = "${path.module}/fichier.txt"
  etag   = filemd5("${path.module}/fichier.txt")
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  source       = "${path.module}/index.html"
  content_type = "text/html"
  etag         = filemd5("${path.module}/index.html")
}

resource "aws_s3_bucket_lifecycle_configuration" "site" {
  depends_on = [aws_s3_bucket_versioning.site]
  bucket     = aws_s3_bucket.site.id

  rule {
    id     = "transition-and-expiration"
    status = "Enabled"

    filter {}

    transition {
      days          = 90
      storage_class = "STANDARD_IA"
    }

    # Suppression après 365 jours
    expiration {
      days = 365
    }
  }
}

output "website_url" {
  value = "http://${aws_s3_bucket_website_configuration.site.website_endpoint}"
}

output "bucket_name" {
  value = aws_s3_bucket.site.id
}
