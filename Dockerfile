from google/cloud-sdk:slim
ENV GOOGLE_APPLICATION_CREDENTIALS=/terraform-playground/account.json

RUN apt update && apt install -y
RUN apt install \
        wget \
        unzip -y

RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
RUN unzip terraform_0.12.20_linux_amd64.zip
RUN mv terraform /usr/local/bin
RUN terraform --version
RUN rm -rf /terraform-playground
RUN git clone https://github.com/dbobryk/terraform-playground
COPY account.json /terraform-playground/account.json
RUN cat /terraform-playground/main.tf
RUN gcloud auth activate-service-account --key-file=/terraform-playground/account.json && gcloud config set project playground-s-11-2d1955 && cd terraform-playground && terraform init && cd terraform-playground && sed -i .bak 's/state-bucket/dbobryk-terraform-testing-1212/g' main.tf && terraform validate && terraform plan -out=tfplan && terraform apply tfplan
# RUN cd terraform-playground && terraform destroy --auto-accept
# gsutil mb gs://dbobryk-terraform-testing-1212 &&