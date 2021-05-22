# google-cloud-vpc-workshop
Launch a Google Cloud VPC following the cloud best practices using Terraform.


## Creating a custom VPC following the Google Cloud Best Practices
In this template we'll deploy a custom VPC with multiples subnets and firewall rules. You don't need to be an expert of networking and subnetting, this template help you to do that and with the plus that all the tagging strategy it align with some variables that you can modify. This template was created following and using the [Best practices and reference architectures for VPC design](https://cloud.google.com/architecture/best-practices-vpc-design).


## What file I need modify to use this template
Are only 1 file that you need modify, and this file is the **terraform.tfvars.example**. First you'll need to change the name to **terraform.tfvars** and later modify the next variables:

- [X] region - by default I set the "us-east1" region, but you can use your favorite.
- [ ] company_name - set the real name of your Company.
- [ ] business_unit - set the name of the business unit or application name that will use this network.
- [ ] project - set your Google Cloud Project ID.
- [ ] \(Optional) network_address_space - If you want, you can change the network address space.
- [ ] \(Optional) subnet_count - As well, you can create more than the default subnets that this template creates.

:warning :warning :warning Remember, I encourage to you don't use an **auth_file** because this can be insecure, instead my recommendation is use the Google Cloud SDK and a default login profile.


## Google Cloud Login Profile
You'll need to install the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) into your laptop or PC to securily use Terraform and deploy resources without hardcoding an **auth_file**.

Before to initiated using the Terraform, you'll need to configure and set a default profile into your laptop or PC. You can use the next CLI command to do that:

**gcloud auth application-default login**


## Terraform Workspace
This template require that you use a Terraform Workspace, Why? Well, remember that this template is builded to follow the Google Cloud VPC best practices and this best practices tell us that we need identify the "environmment" of our resources.

What are the valid Terraform Workspaces names for this template?

- sbx / for Sandbox Environment
- dev / for Development Environment
- uat / for UAT Environment
- prd / for Production Environment

⭐ :star :star And, that's all dudes... you're ready to deploy your Google Cloud VPC!!! :star :star :star

## Conclusion
I hope this template is very useful for you, as it's for me. I'd love to hear feedback and suggestions for revisions.

Oscar
