## Terraform Examples

Very simple Terraform .tf files.

Use these Terraform files to create a server on which to run the Flask Application.

These Terraform .tf files create only a single virtual server.

On this server created by Terraform one could:

1. Clone this repository and build and run the Flask Application 
2. Install Docker to run the Flask Application as a Docker Container

Review the main README for instructions on how to do 1 & 2.

### VMware vSphere Terraform Files

Use the VMware Terraform files for environments based on VMware vSphere - aka ESXI Virtualization and a vCenter

To use these examples your vSphere environment MUST be running a vCenter and have deployed a VM template to clone from.  You may/will need to change the example data in these files to work in your specific environment.

- axnetlabs.tf --> only has usefulness in the Axnet Labs, LLC. VMware Homelab of Joe Axberg.  This file a standard Ubuntu 20.04 server with 1GB RAM, 1 CPU, and 20GB HDD will be created.

- senglab.tf --> only has usefulness in the Dunwoody Software Engineering VMware Lab.  This file will create a standard Ubuntu 20.04 server in that environment. By default an Ubuntu 20.04 with 1GB RAM, 1 CPU, and 20GB HDD will be created.

- awslab.tf --> coming soon, will work with AWS 