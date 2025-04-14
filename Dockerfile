FROM alpine:3.19

# Desired versions
ENV TERRAFORM_VERSION=1.5.7
ENV TERRAGRUNT_VERSION=0.69.10

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    unzip \
    git \
    jq \
    python3 \
    py3-pip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version 

# Install Terragrunt
RUN curl -s -L "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" \
    -o /usr/local/bin/terragrunt && \
    chmod +x /usr/local/bin/terragrunt

ENTRYPOINT ["/bin/bash", "-l", "-c"]