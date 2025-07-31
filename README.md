# Comfy-Runpod

A ComfyUI deployment setup for Runpod with automated model downloading and workflow execution.

## Overview

This project provides a streamlined way to deploy ComfyUI on Runpod using Docker containers with pre-configured nodes and models. It includes automated GitHub Actions for Docker image deployment and scripts for model management.

## Prerequisites

- Docker
- GitHub account
- Runpod account
- DockerHub account

## Setup Instructions

### 1. Initial Setup

First, refer to the official [worker-comfyui repository](https://github.com/runpod-workers/worker-comfyui) for detailed documentation.

### 2. Docker Configuration

Create a Dockerfile based on the `runpod/comfy-worker` base image:

- Add required ComfyUI nodes
- Set Hugging Face home environment variable
- Create symlink: `comfy/models/Llavacheckpoint` → `runpod-volume/models/Llavacheckpoint`

### 3. GitHub Actions Setup

Configure automated deployment to DockerHub:

1. Set up GitHub Actions workflow
2. Add required credentials to GitHub Secrets:
   - DockerHub username
   - DockerHub access token
3. Push changes to GitHub repository

### 4. Runpod Deployment

#### Create Network Volume
Set up a network volume for persistent model storage.

#### Create Template
1. Create a new template in Runpod
2. Set environment variable: `SERVE_API_LOCALLY=true`
3. Expose port `8188` and `8000` for ComfyUI
4. Use your latest Docker image build
5. Configure volume mount to `runpod-volume` (matches `extra_models_path.yaml`)

#### Deploy Pod
Create a pod using the configured template.

### 5. Model Management

#### Download Models
Execute the model download process:

```bash
# Upload download_model.sh to the pod or include it in Docker image
./download_model.sh
```

#### Verify Installation
1. Ensure all models are downloaded successfully
2. Load an upscaler workflow
3. Execute the workflow (will download joycaption beta model if needed)

## Workflow Execution

The system supports upscaling workflows with automatic model downloading:

1. Load your upscaler workflow
2. The system will automatically download the joycaption beta model on first execution
3. Execute the workflow

## Customization

> **Note**: To modify workflows or input structure:
> 1. Clone the [comfy-worker repository](https://github.com/runpod-workers/worker-comfyui)
> 2. Copy the handler code
> 3. Modify according to your requirements
> 4. Replace the existing handler in your Dockerfile

## Files Structure

- `Dockerfile.dev` - Development Docker configuration
- `Dockerfile.main` - Production Docker configuration  
- `download_model.sh` - Script for downloading required models
- `extra_models_path.yaml` - Model path configurations
- `snapshot.json` - ComfyUI snapshot configuration
- `test_input.json` - Sample input for testing workflows

## Troubleshooting

- Ensure volume mounts point to `runpod-volume` path
- Verify all environment variables are properly set
- Check model download completion before running workflows
- Monitor Docker build logs for any installation issues

## Input Structure
The input structure for workflows is defined in `test_input.json`. Modify this file to suit your workflow requirements.