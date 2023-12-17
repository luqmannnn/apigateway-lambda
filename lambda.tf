# Defines the lambda function code that will be zipped

data "archive_file" "lambda_one" {
  type        = "zip"
  source_file = "./files/hello_lambda.js"
  output_path = "./files/hello_lambda.zip"
}

data "archive_file" "lambda_two" {
  type        = "zip"
  source_file = "./files/congrats_lambda.js"
  output_path = "./files/congrats_lambda.zip"
}

resource "aws_lambda_function" "lambda_one" {
  function_name    = "helloLambdaFunction"
  handler          = "hello_lambda.handler"
  runtime          = "nodejs14.x"
  role              = aws_iam_role.iam_for_lambda.arn
  filename         = data.archive_file.lambda_one.output_path                      # Adjust the path
  source_code_hash = data.archive_file.lambda_one.output_base64sha256               # Adjust the path
}

resource "aws_lambda_function" "lambda_two" {
  function_name    = "congratsLambdaFunction"
  handler          = "congrats_lambda.handler"
  runtime          = "nodejs14.x"
  role              = aws_iam_role.iam_for_lambda.arn
  filename         = data.archive_file.lambda_two.output_path                      # Adjust the path
  source_code_hash = data.archive_file.lambda_two.output_base64sha256               # Adjust the path
}

