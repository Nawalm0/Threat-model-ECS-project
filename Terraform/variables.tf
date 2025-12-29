variable "region" {
  description = "This is the region that will be used"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "threatcomposer"
}

variable "environment" {
  description = "environment of the project"
  type        = string
  default     = "dev"
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 3000
}