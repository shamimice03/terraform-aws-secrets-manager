###########################################
#  Variables for Random Password
###########################################

variable "password_length" {
  description = "Define the password length"
  type        = number
  default     = 30
}

variable "min_upper" {
  description = "Define the minimun of uppercase character"
  type        = number
  default     = 5
}

variable "min_lower" {
  description = "Define the minimun of lowercase character"
  type        = number
  default     = 5
}

variable "min_numeric" {
  description = "Define the minimun of numeric character"
  type        = number
  default     = 5
}
variable "min_special" {
  description = "Define the minimun of special character"
  type        = number
  default     = 5
}

variable "must_have_special_character" {
  description = "Define the must have special character"
  type        = string
  default     = "@#"
}

###########################################
#  Variables for Aws Secret Manager
###########################################

variable "db_username" {
  description = "Database username"
  type        = string
  default     = null
}

variable "secret_name" {
  description = "Secret Name of AWS Secrets Manager"
  type        = string
  default     = null
}


variable "recovery_window" {
  description = "Recovery window of an existed secret"
  type        = number
  default     = 0
}

variable "secret_tags" {
  description = "Tags for secrets"
  type = map(any)
  default = {}
}