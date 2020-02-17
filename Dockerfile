from google/cloud-sdk:slim

RUN apt update && apt install -y
RUN apt install \
        wget \
        unzip -y

RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
RUN unzip terraform_0.12.20_linux_amd64.zip
RUN mv terraform /usr/local/bin
RUN terraform --version
COPY account.json /terraform-playground/account.json
RUN gcloud auth activate-service-account --key-file=/terraform-playground/account.json
RUN git clone https://github.com/dbobryk/terraform-playground
RUN cd terraform-playground && terraform init && pwd
RUN cd terraform-playground && terraform validate && terraform plan -out=tfplan && terraform apply tfplan
# RUN cd terraform-playground && terraform destroy --auto-accept