## Terraform AKS Demo

 This project aims to deploy a demo AKS cluster whitin Azure with **node autoscaler** and **horizontal pod autoscaler** enabled for an example application, currently a wordpress blog.
 
###  Running

You first need to create your own `terraform.tfvars` from `terraform.tfvars.example` and `backends.tf` from `backends.tf.example` if you desire to use remote state.

```
$ terraform init
$ terraform plan
$ terraform apply
```

### Resources

* [Cluster Autoscaler AKS Deployment](https://docs.microsoft.com/en-us/azure/aks/autoscaler)
* [AKS Terraform Resource](https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html)
* [Kubernetes Terraform Provider](https://www.terraform.io/docs/providers/kubernetes/index.html)


### Contact

Guilherme França / **guilherme.franca@microsoft.com**

### Disclaimer

This is not supported in any form. Use at your own risk.
