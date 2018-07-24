# QuickStart

## Initialise

> The terraform init command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times.

```sh
terraform init
```

## Applying a Plan

> The terraform plan command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

Now that we're ready to create our resources, let's generate a plan file.

```sh
terraform plan -out=sql-database.tfplan
```

Now we can safely change our configuration files, and as long as we don't re-create our plan, we can be sure that this is all that's going to be applied.

Let's finally give that a go, run the following command:

```sh
terraform apply sql-database.tfplan
```

# Destroy Infrastructure

We've now seen how to build and change infrastructure. You can cleanup the Terraform-managed infrastructure.

```sh
terraform destroy -force
```
