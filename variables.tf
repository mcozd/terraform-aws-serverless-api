variable "name" {
  type        = string
  description = "The name of your api."
}

variable "description" {
  type        = string
  description = "A description of your api, e.g. purpose, domain, type of data."
  default     = ""
}

variable "no_execute_api_access" {
  type        = bool
  description = "Disables the execute-api domain for access to this api."
  default     = false
}

variable "endpoints_on_edge" {
  type        = bool
  description = "Enable edge optimization for your endpoints."
  default     = false
}

variable "default_policy" {
  type        = string
  description = "Overwrites the default rest policy for your api. Provide an IAM policy document as json."
  default     = ""
}
