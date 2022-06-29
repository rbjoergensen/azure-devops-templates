# Azure DevOps pipeline templates
A collection of templates that can be used for simplifying the configuration of build and deployment pipelines.
## Terraform
Templates used for runnings applying Terraform configuration.
### Main
Contains two stages for planning and applying configuration. 
The reason it is split into two is so that the apply stage can have additional validation through environments.
It also makes it simpler visually as the template will skip the upload of artifacts and the apply stage if there are no changes to be made.
<br/><br/>
The template currently only works with the AWS provider.

#### Parameters
The templates takes the following parameters.

|Name         |Description|Default value|
|:------------|:----------|:------------|
|`environment`|The Azure environment to use in the apply stage|`null`|
|`workingdir` |The working directory of the Terraform workspace|$(System.DefaultWorkingDirectory)|
|`connection` |The service connection for AWS or Azure|`null`|
|`options`    |Additional commandline options such as variables or other Terraform parameters|`null`|
|`aws_region` |The default AWS region|`null`|

#### Example
A pipeline for deploying a Terraform configuration would look like this.
``` yaml
trigger:
  branches:
    include:
      - main

resources:
  repositories:
  - repository: templates
    type: github
    name: rbjoergensen/azure-devops-templates
    endpoint: github

stages:
- template: /terraform/main.yml@templates
  parameters:
    environment: test
    workingdir: terraform/example
    connection: aws-callofthevoid
    aws_region: eu-central-1
```