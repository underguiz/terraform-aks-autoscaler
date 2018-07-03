## Terraform AKS Demo

 This project aims to deploy a demo AKS cluster whitin Azure with **node autoscaler** and **horizontal-pod-scaler** enabled for an example application, currently a wordpress blog.
 
###  Running

You first need to create your own `terraform.tfvars` from `terraform.tfvars.example` and `backends.tf` from `backends.tf.example` if you desire to use remote state.

```
$ terraform init
$ terraform plan
$ terraform apply
```
### Contact

Guilherme França / **guilherme.franca@microsoft.com**