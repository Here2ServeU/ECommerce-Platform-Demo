resource "aws_iam_role" "this" {
  name = "${var.name}-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "states.${data.aws_region.current.name}.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      },
    ],
  })

  tags = var.tags
}

resource "aws_iam_role_policy" "this" {
  name   = "${var.name}-policy"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "lambda:InvokeFunction",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:GetItem",
      "s3:GetObject",
      "s3:PutObject",
      "sns:Publish",
    ]
    resources = var.resource_arns
  }
}

resource "aws_sfn_state_machine" "this" {
  name     = var.name
  role_arn = aws_iam_role.this.arn
  definition = file(var.definition_file)

  tags = var.tags
}
