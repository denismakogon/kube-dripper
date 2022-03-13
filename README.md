# kube-dripper
DRipper batch deploy on Kubernetes via Terraform

## how to use it

I'm assuming you already have a Kubernetes cluster running somewhere, if not - get one!

```terraform
module "ripper_deployment" {
  source = "./modules/v1_deployment"
  for_each = toset(var.attack_hosts)

  deployment_name = "${split(",", each.value)[0]}-deployment"

  ripper_attack_host = split(",", each.value)[0]
  ripper_attack_port = split(",", each.value)[1]
  thread_count       = split(",", each.value)[2]
  attack_method      = split(",", each.value)[3]

  number_of_replicas = (var.vcpus_per_node / 0.5 * var.node_pool_size) / length(var.attack_hosts)
}
```
