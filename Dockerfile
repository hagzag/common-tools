FROM --platform=$BUILDPLATFORM alpine:3.19

ARG TARGETARCH
ENV TERRAFORM_VERSION=1.11.4
ENV TERRAGRUNT_VERSION=0.77.20

RUN apk add --no-cache \
    bash \
    curl \
    unzip \
    git \
    jq \
    python3 \
    py3-pip \
    aws-cli

# Install Terraform for the appropriate architecture
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip

# Install Terragrunt
RUN curl -sSL "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_${TARGETARCH}" \
    -o /usr/local/bin/terragrunt && \
    chmod +x /usr/local/bin/terragrunt

RUN terraform --version && terragrunt --version

ENTRYPOINT ["/bin/bash", "-l", "-c"]