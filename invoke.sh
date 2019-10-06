aws lambda invoke \
  --invocation-type Event \
  --function-name example-recursive-lambda \
  --region us-east-1 \
  --profile default \
  output.txt && cat output.txt
