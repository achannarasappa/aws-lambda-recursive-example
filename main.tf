provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "example" {
  name = "example"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda-role-policy-attach" {
  role       = "${aws_iam_role.example.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
}

resource "aws_iam_role_policy_attachment" "lambda-execute-policy-attach" {
  role       = "${aws_iam_role.example.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}

resource "aws_iam_role_policy_attachment" "lambda-basic-execution-policy-attach" {
  role       = "${aws_iam_role.example.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


resource "aws_lambda_function" "example" {
  function_name    = "example-recursive-lambda"
  filename         = "src.zip"
  source_code_hash = filebase64sha256("src.zip")

  handler = "handler.example"
  runtime = "nodejs10.x"
  timeout = 30

  role = "${aws_iam_role.example.arn}"
}
