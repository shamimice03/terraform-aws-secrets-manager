output "secret_ids" {
  description = "Secret ids"
  value = {
    for key, value in aws_secretsmanager_secret.db_secret : key => value["id"]
  }
}

output "secret_arns" {
  description = "Secrets arns"
  value = {
    for key, value in aws_secretsmanager_secret.db_secret : key => value["arn"]
  }
}