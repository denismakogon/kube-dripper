variable "namespace" {
  default = "default"
}

variable "number_of_replicas" {}

variable "ripper_image" {
  default = "denismakogon/dripper:latest"
}

variable "ripper_attack_host" {}

variable "ripper_attack_port" {}

variable "thread_count" {}

variable "attack_method" {}

variable "deployment_name" {}
