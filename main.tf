resource "random_password" "password" {
  length           = var.password_length
  min_upper        = var.min_upper
  min_lower        = var.min_lower
  min_special      = var.min_special
  min_numeric      = var.min_numeric
  override_special = var.must_have_special_character
  count = 3
}

locals {

  credentials = {

    username = var.db_username
    password = random_password.password[0].result

  }
}

resource "aws_secretsmanager_secret" "secret_mysql_db" {
  name                    = var.secret_name
  recovery_window_in_days = var.recovery_window

  tags = var.secret_tags
}


resource "aws_secretsmanager_secret_version" "secret_mysql_db_version" {
  secret_id     = aws_secretsmanager_secret.secret_mysql_db.id
  secret_string = jsonencode(local.credentials)
}

