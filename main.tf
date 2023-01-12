resource "random_password" "password" {
  for_each         = var.secret
  length           = var.password_length
  min_upper        = var.min_upper
  min_lower        = var.min_lower
  min_special      = var.min_special
  min_numeric      = var.min_numeric
  override_special = var.must_have_special_character
}


resource "aws_secretsmanager_secret" "db_secret" {
  for_each                = var.secret
  name                    = each.key
  recovery_window_in_days = var.secret[each.key].recovery_window
}


resource "aws_secretsmanager_secret_version" "db_secret_version" {
  for_each  = var.secret
  secret_id = aws_secretsmanager_secret.db_secret[each.key].id
  secret_string = jsonencode(
    {
      description = var.secret[each.key].description
      username    = var.secret[each.key].db_name
      password    = random_password.password[each.key].result
    }
  )
}
