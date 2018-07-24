# QuickStart

## Initialise

```sh
terraform init
```

## Applying a Plan

```sh
terraform plan -out=sql-database.tfplan
terraform apply sql-database.tfplan
```

## Destroy Infrastructure

```sh
terraform destroy -force
```
