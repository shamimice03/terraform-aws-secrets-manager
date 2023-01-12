# Sample "terraform.tfvars" file

```
password_length             = 40
min_upper                   = 5
min_lower                   = 5
min_numeric                 = 5
min_special                 = 5
must_have_special_character = "#@%"

secret = {

  "rds/mysql" = {
      description     = "Mysql credentials"
      recovery_window = 0
      db_name         = "db_admin_mysql"
      tags = {
        Name = "mysql"
      }
    },
    
  "rds/postgresql" = {
      description     = "postgres credentials"
      recovery_window = 0
      db_name         = "db_admin_postgres"
      tags = {
        Name = "postgresql"
      }
  },

}

```