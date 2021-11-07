terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.83.0"
    }
  }
}

provider "azurerm" {
  features{

  }

  subscription_id = "d7e3ca1d-843b-46c2-8858-13b06ec2d07a"
  client_id       = "9d19ec9d-d886-4ae8-84d5-36c77c5d31fe"
  client_secret   = "TCO7Q~yZT6T36WOGDuSeukb8iMj1_S3xCl1Oj"
  tenant_id       = "dca455ca-117d-46e4-b8a3-0b9e3b1d9c5f"
}

resource "azurerm_resource_group" "tf_test" {
  name              = "rg-maintf"
  location          = "eastus"
}

resource "azurerm_container_group" "tfcg_test" {
  name                          = "weatherapi"
  location                      = azurerm_resource_group.tf_test.location
  resource_group_name           = azurerm_resource_group.tf_test.name

  ip_address_type     =  "public"
  dns_name_label      = "123l"
  os_type             = "Linux"

  container {
    name        = "weatherapi"
    image       = "123l/weatherapi"
    cpu         = "1"
    memory      = "1"

    ports {
      port         = 80
      protocol     = "TCP"
    } 
  }
}