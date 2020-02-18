### variables.tf ###
variable "project_id" {
  default     = "playground-s-11-39df4b"
  description = "The project to create the resources in."
}

variable "region" {
  default     = "us-central1"
  description = "regions should be used"
}

variable "username" {
  default = "dbobryk"
}

variable "password" {
  default = ""
}
