<br/>
<p align="center">
    <a href="https://www.witboost.com/">
        <img src="docs/img/witboost_logo.svg" alt="witboost" width=600 >
    </a>
</p>
<br/>

Designed by [Agile Lab](https://www.agilelab.it/), Witboost is a versatile platform that addresses a wide range of sophisticated data engineering challenges. It enables businesses to discover, enhance, and productize their data, fostering the creation of automated data platforms that adhere to the highest standards of data governance. Want to know more about Witboost? Check it out [here](https://www.witboost.com/) or [contact us!](https://witboost.com/contact-us)

This repository is part of our [Starter Kit](https://github.com/agile-lab-dev/witboost-starter-kit) meant to showcase Witboost's integration capabilities and provide a "batteries-included" product.

# ADLS Gen2 Storage

- [Overview](#overview)
- [Configuring](#configuring)
- [Deploying](#deploying)
- [HLD](docs/HLD.md)

## Overview

This project allows to provision an Azure `Storage Account` and one or more ADLS Gen2 `container` inside it.
The Terraform configuration files can be found inside the [files](files) folder.

It's a module ready to be used by our OSS [Terraform Specific Provisioner](https://github.com/agile-lab-dev/witboost-terraform-scaffold).

## Configuring

The `Resource Group` where to publish the Storage Account must already exist.

### Environment variables

To authenticate on Azure using a Service Principal with a Client Secret, the following env variables need to be defined:
- `ARM_CLIENT_ID` - The Client ID of the Service Principal.
- `ARM_CLIENT_SECRET` - The Client Secret of the Service Principal.
- `ARM_SUBSCRIPTION_ID` - The Subscription ID in which the Storage Account exists.
- `ARM_TENANT_ID` - The Tenant ID in which the Subscription exists.

### Example configuration for the Terraform SP

```
  terraform {
    "urn:dmb:utm:azure-storage-adlsgen2-template:0.0.0" {
      repositoryPath: "/tf/adlsgen2"
      descriptorToVariablesMapping: {
        dp_domain = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.component.dpDomain"
        dp_name_major_version = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.component.dpNameMajorVersion"
        component_name = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.component.name"
        resource_group = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.resourceGroup"
        environment = "$.dataProduct.environment"
        account_tier = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.performance"
        account_replication_type = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.redundancy"
        access_tier = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.accessTier"
        infrastructure_encryption_enabled = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.infrastructureEncryptionEnabled"
        allow_nested_items_to_be_public = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.allowNestedItemsToBePublic"
        containers = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.containers"
      }
      principalMappingPlugin {
           pluginClass: "it.agilelab.plugin.principalsmapping.impl.azure.AzureMapperFactory"
           azure: {
              tenantId: ${?PRINCIPAL_MAPPING_TENANT_ID}
              clientId: ${?PRINCIPAL_MAPPING_CLIENT_ID}
              clientSecret: ${?PRINCIPAL_MAPPING_CLIENT_SECRET}
           }
      }
      backendConfigs: {
        stateKey = "key"
        configs = {
          key = "$.dataProduct.components[?(@.id == '{{componentIdToProvision}}')].specific.state.key"
        }
      }
    }
  }
```

To learn more about the configuration parameters, please refer to the [documentation](https://github.com/agile-lab-dev/witboost-terraform-scaffold?tab=readme-ov-file#configuring) of the Terraform Specific Provisioner.

### Terraform State

We recommend to have a different Storage Account where Terraform can save the remote state for this module.

## Deploying

The module is packaged as an **Helm Chart**.
It must be deployed as part of an **Umbrella Chart** along with the Terraform Specific Provisioner and, eventually, other modules.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| enabled | bool | `true` | Include the TF module to create the Storage Account |
| state | object | `{"container_name":"","resource_group_name":"","storage_account_name":""}` | Terraform Remote State configuration |
| state.container_name | string | `""` | The Name of the Storage Container within the Storage Account |
| state.resource_group_name | string | `""` | The Name of the Resource Group in which the Storage Account exists |
| state.storage_account_name | string | `""` | The Name of the Storage Account |

## License

This project is available under the [Apache License, Version 2.0](https://opensource.org/licenses/Apache-2.0); see [LICENSE](LICENSE) for full details.

## About Witboost

[Witboost](https://witboost.com/) is a cutting-edge Data Experience platform, that streamlines complex data projects across various platforms, enabling seamless data production and consumption. This unified approach empowers you to fully utilize your data without platform-specific hurdles, fostering smoother collaboration across teams.

It seamlessly blends business-relevant information, data governance processes, and IT delivery, ensuring technically sound data projects aligned with strategic objectives. Witboost facilitates data-driven decision-making while maintaining data security, ethics, and regulatory compliance.

Moreover, Witboost maximizes data potential through automation, freeing resources for strategic initiatives. Apply your data for growth, innovation and competitive advantage.

[Contact us](https://witboost.com/contact-us) or follow us on:

- [LinkedIn](https://www.linkedin.com/showcase/witboost/)
- [YouTube](https://www.youtube.com/@witboost-platform)
