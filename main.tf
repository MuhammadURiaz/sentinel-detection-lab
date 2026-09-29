resource "azurerm_resource_group" "rg" {
  name = "rg-${var.prefix}"





  location = "uksouth"
  tags = {
    project = "sentinel-detection-lab"
    owner   = "usmaan"
    env     = "lab"
  }
}
