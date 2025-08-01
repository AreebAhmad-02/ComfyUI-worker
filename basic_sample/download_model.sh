#!/bin/bash

MODEL_DIR=/runpod-volume/ComfyUI/models

# Create the full model directory tree
mkdir -p "$MODEL_DIR/vae"
mkdir -p "$MODEL_DIR/checkpoints"
chmod -R 777 "$MODEL_DIR"

# Download SDXL VAE
if [ ! -f "$MODEL_DIR/vae/sdxl_vae.safetensors" ]; then
    wget -O "$MODEL_DIR/vae/sdxl_vae.safetensors" \
    "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors?download=true"
fi

# Download SD 1.5 checkpoint
if [ ! -f "$MODEL_DIR/checkpoints/v1-5-pruned-emaonly-fp16.safetensors" ]; then
    wget -O "$MODEL_DIR/checkpoints/v1-5-pruned-emaonly-fp16.safetensors" \
    "https://huggingface.co/Comfy-Org/stable-diffusion-v1-5-archive/resolve/main/v1-5-pruned-emaonly-fp16.safetensors?download=true"
fi

if [ ! -f "$MODEL_DIR/checkpoints/sd_xl_refiner_1.0.safetensors" ]; then
    wget -O "$MODEL_DIR/checkpoints/sd_xl_refiner_1.0.safetensors" \
    "https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
fi



# add authorization header if needed
# if you have a Hugging Face token, uncomment the following line and replace YOUR_TOKEN with your actual token
# --header="Authorization Bearer YOUR_TOKEN" 
# if [ ! -f "$MODEL_DIR/vae/ae.safetensors" ]; then
#     wget -c https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors -P "$MODEL_DIR/vae/"
# fi

# echo "runpod-worker-comfy: Starting ComfyUI"
# python3 ./ComfyUI/main.py --disable-auto-launch --disable-metadata --listen &