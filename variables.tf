variable "kubeconfig_path" {
  type = string
}

variable "vcpus_per_node" {
  default = 1
  type = string
  description = "vCPUs per node"
}
variable "memory_per_node" {
  default = 4
  type = string
  description = "RAM per node"
}
variable "node_pool_size" {
  default = 5
  type = string
  description = "size of a cluster"
}

variable "attack_hosts" {
  type = list(string)
  description = "a list of comma-separated values: <host>,<port>,<thread_count>,<attack_type>"
}
