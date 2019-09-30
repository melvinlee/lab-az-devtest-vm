data "terraform_remote_state" "vm" {
backend = "local"

  config = {
    path = "${path.module}/../virtual-machines/terraform.tfstate"
  }
}

resource "azurerm_virtual_machine_extension" "vmext" {
  name                 = "bootstrap.ps1"
  location             = data.terraform_remote_state.vm.outputs.location
  resource_group_name  = data.terraform_remote_state.vm.outputs.resource_group
  virtual_machine_name = data.terraform_remote_state.vm.outputs.vm_name
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
         "fileUris": ["https://raw.githubusercontent.com/melvinlee/azure-devlab/master/virtual-machines-extension/bootstrap.ps1"]
    }
  SETTINGS

  protected_settings = <<SETTINGS
    {
        "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File bootstrap.ps1"
    }
    SETTINGS
}
