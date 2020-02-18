## Terraform GCP playground

#### What is this?

Terraform is going to be a very useful tool for quickly creating cloud infrastructure
and this is my attempt to gain a better understanding of how the tool currently
works. My goal is to create multiple K8s clusters, one with public access and
one without. Spin up services in both of these clusters and have them communicate
preferably with istio or another service mesh.

## What's done so far?
Currently I am using my subscription to Linux Academy to create infrastructure 
on their Cloud Playground, these are short lived GCP instances. This was causing
me issues with having multiple sets of credentials and having to login through gcloud
to create GCS buckets for storing state files. I got the networks and compute instances
done switching accounts but this got to be tiresome so I built a docker container
that mounts the current working directory as a volume in a docker container
that has the gcloud, terraform and kubernetes tools installed. The folder needs
to have a service account key in the root and a project name in the configs/projects
files. If you want to use GCS buckets for state storage you can replace the bucket-name
in your main.tf file with `STATE-BUCKET` and set the value of your project id 
variable in variables.tf in the root to `PROJECT-ID` and the scripts will use
sed to replace these values with a randomly generated bucket and the project id with
the value in configs/project file.

Now that the config is setup, running `docker run -it -v $(pwd):/workdir tinywarrior/gcloud-terraform`
should generate the following:
- Two VPC networks
    - vms
    - k8s
- Four subnets
    - vms-private and vms-public
    - k8s-private and k8s-public
- Two VMs, one in each subnet in the vms vpc
- Two K8s clusters
    - One in each subnet in the k8s vpc
    - One node pool in each cluster
- One nginx deployment
- One service for the nginx deployment to make it publicly accessible
