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

* [Cluster Autoscaler AKS Deployment](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/azure/README.md#aks-or-acs-deployment)
* [Metrics Server](https://github.com/kubernetes-incubator/metrics-server/)
* [AKS Terraform Resource](https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html)
* [Kubernetes Terraform Provider](https://www.terraform.io/docs/providers/kubernetes/index.html)

### Notes

Sometimes API calls fails with timeout for logs / port-forward and others. [github issue](https://github.com/Azure/AKS/issues/232).

### Contact

Guilherme França / **guilherme.franca@microsoft.com**

### Disclaimer

This is not supported in any form. Use at your own risk,
