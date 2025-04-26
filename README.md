# Common Tools Docker Image

## Overview

This Docker image provides a curated set of tools commonly used in infrastructure management, automation, and development workflows. It is designed to simplify CI/CD processes by pre-packaging essential utilities such as `Terraform`, `Terragrunt`, `OpenTofu`, and more.

## Tools Included

### Pre-installed Tools
- **Bash**: A widely-used shell for scripting and command-line tasks.
- **curl**: A command-line tool for transferring data with URLs.
- **unzip**: A utility to extract `.zip` files.
- **git**: A version control system for managing source code repositories.
- **jq**: A lightweight and flexible command-line JSON processor.
- **Python 3**: A versatile programming language for automation and scripting.
- **pip (py3-pip)**: The Python package installer for managing Python libraries.
- **AWS CLI**: A command-line tool to manage AWS services.

### Infrastructure Tools
- **Terraform**:
  - HashiCorp's infrastructure-as-code tool for building and managing infrastructure resources.
  - Installed version: `1.11.4` (default, configurable via `TERRAFORM_VERSION`).
- **Terragrunt**:
  - A wrapper for Terraform that simplifies configurations and enables DRY (Don't Repeat Yourself) principles.
  - Installed version: `0.77.20` (default, configurable via `TERRAGRUNT_VERSION`).
- **OpenTofu**:
  - A community-driven fork of Terraform for managing infrastructure with similar functionality.
  - Installed version: `1.9.0` (default, configurable via `TOFU_VERSION`).

## Environment Variables

The following environment variables can be set to customize tool versions at build time:
- `TERRAFORM_VERSION`: Specifies the version of Terraform to install (default: `1.11.4`).
- `TERRAGRUNT_VERSION`: Specifies the version of Terragrunt to install (default: `0.77.20`).
- `TOFU_VERSION`: Specifies the version of OpenTofu to install (default: `1.9.0`).

## Usage

### Pull the Image
You can pull the pre-built Docker image from your container registry:
```bash
docker pull ghcr.io/hagzag/common-tools:latest
```

### Use in github-actions - needs validation

```yaml

```

### Use in gitlab-ci

```yaml
example-job:
  image: ghcr.io/hagzag/common-tools:latest
  script:
    - echo "Using ghcr.io/hagzag/common-tools Docker image in GitLab CI"
```
