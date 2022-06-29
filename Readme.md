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
<br/><br/>
The templates takes the following parameters

|Name|Default|Description|
|----|-------|-----------|
||||

parameters:
- name: environment
  type: string
  default:
- name: workingdir
  type: string
  default:
- name: connection
  type: string
  default:
- name: options
  type: string
  default:
- name: aws_region
  type: string
  default: