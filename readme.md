## Recursive AWS Lambda example

Minimal example of a recursive AWS Lambda function based in Node and Terraform. Function will stop after 4 executions by default.

### Setup

1. Install nodejs
1. Install [terraform](https://www.terraform.io/downloads.html)
1. Install [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
1. [Configure aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
1. Initialize terraform `terraform init`

### Usage

1. Build `npm run build`
1. Push to AWS `terraform apply`
1. Invoke function `npm run invoke`
1. View log output on [CloudWatch](https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#logStream:group=/aws/lambda/example-recursive-lambda;streamFilter=typeLogStreamPrefix)