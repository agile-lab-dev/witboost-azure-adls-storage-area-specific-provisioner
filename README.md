<br/>
<p align="center">
    <a href="https://www.agilelab.it/witboost">
        <img src="docs/img/witboost_logo.svg" alt="witboost" width=600 >
    </a>
</p>
<br/>

Designed by [Agile Lab](https://www.agilelab.it/), Witboost is a versatile platform that addresses a wide range of sophisticated data engineering challenges. It enables businesses to discover, enhance, and productize their data, fostering the creation of automated data platforms that adhere to the highest standards of data governance. Want to know more about Witboost? Check it out [here](https://www.agilelab.it/witboost) or [contact us!](https://www.agilelab.it/contacts)

This repository is part of our [Starter Kit](https://github.com/agile-lab-dev/witboost-starter-kit) meant to showcase Witboost's integration capabilities and provide a "batteries-included" product.

# ADLS Gen2 Storage

- [Overview](#overview)
- [Configuring](#configuring)
- [Deploying](#deploying)
- [HLD](docs/HLD.md)

## Overview

This project allows to provision an ADLS Gen2 `container` on a pre-existing Azure Storage Account. The storage account must have the `Hierarchical namespace` option enabled.
The Terraform configuration files can be found inside the [files](files) folder.

It's a module ready to be used by our OSS [Terraform Specific Provisioner](https://github.com/agile-lab-dev/witboost-terraform-scaffold).

## Configuring

### Environment variables

To authenticate on Azure using a Service Principal with a Client Secret, the following env variables need to be defined:
- `ARM_CLIENT_ID` - The Client ID of the Service Principal.
- `ARM_CLIENT_SECRET` - The Client Secret of the Service Principal.
- `ARM_SUBSCRIPTION_ID` - The Subscription ID in which the Storage Account exists.
- `ARM_TENANT_ID` - The Tenant ID in which the Subscription exists.

### Example configuration for the Terraform SP

TODO

To learn more about the configuration parameters, please refer to the [documentation](https://github.com/agile-lab-dev/witboost-terraform-scaffold?tab=readme-ov-file#configuring) of the Terraform Specific Provisioner.

### Terraform State

We recommend to have a different Storage Account where Terraform can save the remote state for this module.

## Deploying

The module is packaged as an **Helm Chart**.
It must be deployed as part of an **Umbrella Chart** along with the Terraform Specific Provisioner and, eventually, other modules.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| enabled | bool | `true` | Include the TF module to create a ADLS Gen2 container |

## License

This project is available under the [Apache License, Version 2.0](https://opensource.org/licenses/Apache-2.0); see [LICENSE](LICENSE) for full details.

## About us

<br/>
<p align="center">
    <a href="https://www.agilelab.it">
        <img src="docs/img/agilelab_logo.svg" alt="Agile Lab" width=600>
    </a>
</p>
<br/>

Agile Lab creates value for its Clients in data-intensive environments through customizable solutions to establish performance driven processes, sustainable architectures, and automated platforms driven by data governance best practices.

Since 2014 we have implemented 100+ successful Elite Data Engineering initiatives and used that experience to create Witboost: a technology-agnostic, modular platform, that empowers modern enterprises to discover, elevate and productize their data both in traditional environments and on fully compliant Data mesh architectures.

[Contact us](https://www.agilelab.it/contacts) or follow us on:
- [LinkedIn](https://www.linkedin.com/company/agile-lab/)
- [Instagram](https://www.instagram.com/agilelab_official/)
- [YouTube](https://www.youtube.com/channel/UCTWdhr7_4JmZIpZFhMdLzAA)
- [Twitter](https://twitter.com/agile__lab)
