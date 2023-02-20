resource "aws_s3_bucket" "fisher_sh" {
  bucket = "fisher.sh"
}

resource "aws_s3_bucket" "www_fisher_sh" {
  bucket = "www.fisher.sh"
}

resource "aws_s3_bucket_policy" "fisher_sh" {
  bucket = aws_s3_bucket.fisher_sh.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::fisher.sh/*"
      }
    ]
  })
}

resource "aws_s3_bucket_policy" "www_fisher_sh" {
  bucket = aws_s3_bucket.www_fisher_sh.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::www.fisher.sh/*"
      }
    ]
  })
}

resource "aws_s3_bucket_acl" "fisher_sh" {
  bucket = aws_s3_bucket.fisher_sh.id
  acl    = "public-read"
}

resource "aws_s3_bucket_acl" "www_fisher_sh" {
  bucket = aws_s3_bucket.www_fisher_sh.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "fisher_sh" {
  bucket = aws_s3_bucket.fisher_sh.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_website_configuration" "www_fisher_sh" {
  bucket = aws_s3_bucket.www_fisher_sh.id

  redirect_all_requests_to {
    host_name = "fisher.sh"
    protocol  = "http"
  }
}
