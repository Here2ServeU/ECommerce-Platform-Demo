resource "aws_s3_bucket" "frontend_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_policy" "frontend_policy" {
  bucket = aws_s3_bucket.frontend_bucket.id
  policy = jsonencode({
    Statement = [
      {
        Action    = "s3:GetObject"
        Effect    = "Allow"
        Resource  = "${aws_s3_bucket.frontend_bucket.arn}/*"
        Principal = "*"
      }
    ]
  })
}

resource "aws_s3_bucket_object" "index_html" {
  bucket = aws_s3_bucket.frontend_bucket.id
  key    = "index.html"
  content = <<HTML
  <!DOCTYPE html>
  <html>
  <head>
      <title>T2S E-Commerce</title>
  </head>
  <body>
      <h1>Welcome to T2S E-Commerce</h1>
      <p>Where we offer multiple services helping you reach your financial goals through IT jobs!</p>
      <form action="https://{API_GATEWAY_URL}/submit-form" method="POST">
          <label for="service">Service</label>
          <input type="text" id="service" name="service" required><br>
          <label for="first_name">First Name</label>
          <input type="text" id="first_name" name="first_name" required><br>
          <label for="last_name">Last Name</label>
          <input type="text" id="last_name" name="last_name" required><br>
          <label for="phone">Phone</label>
          <input type="tel" id="phone" name="phone" required><br>
          <label for="email">Email</label>
          <input type="email" id="email" name="email" required><br>
          <label for="address">Address</label>
          <textarea id="address" name="address" required></textarea><br>
          <button type="submit">Submit</button>
      </form>
  </body>
  </html>
  HTML
  content_type = "text/html"
}
