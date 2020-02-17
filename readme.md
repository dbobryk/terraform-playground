## Terraform GCP playground

#### Done:
- Create two GCP networks
- Create two subnets in each network
- Create some firewalls rules
- Create two VMs in the VMs network, one on each subnet
- Create a K8s cluster on each subnet

#### ToDo:

- Create an SQL instance
- Read Me files for each module
- The Dockerfile is ugly but it works, need to build  a base image with the 
    appropriate tools that can run a script to run terraform

#### Bugs:
- ~~It tries to create my networks twice~~
    - Fixed this by not importing the network module into the compute 
    module and outputting my network values, reading them into the root 
    main.tf and then setting them into the compute module.
- Public VMs aren't getting an external IP 
- The private K8s nodes are getting an external IP. 
