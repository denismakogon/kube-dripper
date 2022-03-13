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
