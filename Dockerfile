FROM google/cloud-sdk:slim

RUN apt update && apt install -y
RUN apt install \
        wget \
        unzip \
        && rm -rf /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip \
    && unzip terraform_0.12.20_linux_amd64.zip && mv terraform /usr/local/bin \
    && rm terraform_0.12.20_linux_amd64.zip

COPY ./scripts/build.sh /build.sh
COPY ./scripts/destroy.sh /destroy.sh