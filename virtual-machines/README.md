# Dev-lab VM Windows10

## What does it create ?

1. main.tf deploy Windows Virtual Machines.

## Required Tooling

- [Terraform](https://www.terraform.io/)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

## Running

1. Login to the Azure CLI az login
2. Clone this repository and cd into the directory
3. Create a varaibles.tfvars file and add your variables

Example: `variables.tfvars`

```tf
admin_username = "developer"
admin_password = "<password>"

# Optional
resource_group_name = "" (Default:devlab-services-rg)
resource_group_location = ""  (Default:southeastasia)
vm_size = "" (Default:Standard_D4s_v3)
```

4. Run `terraform init` then `terraform plan` to see what will be created, finally if it looks good run `terraform apply`

```sh
terraform init
terraform plan -var-file=variables.tfvars -out=azure-vm.tfplan
terraform apply azure-vm.tfplan
```

## Cleanup

You can cleanup the Terraform-managed infrastructure.

```sh
terraform destroy -var-file=variables.tfvars -force
```
