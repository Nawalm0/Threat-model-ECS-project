variable "project_name" {
  type = string
}

variable "task_cpu" {
  type = number
}

variable "task_memory" {
  type = number
}

variable "execution_role_arn" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}

variable "image_url" {
  type = string
}
variable "service_name" {
  type = string
}


variable "subnet_ids" {
  type = list(string)
}

variable "ecs_security_group_id" {
  type = string
}
variable "assign_public_ip" {
  type = bool
}

variable "target_group_arn" {
  type = string
}

variable "desired_count" {
  type = number

}

variable "task_family" {

  type = string
}








