#!/bin/bash


MODEL_DIR=/runpod-volume/models/
mkdir -p $MODEL_DIR
chmod -R 777 /runpod-volume/models
# https://huggingface.co/realung/flux1-dev.safetensors/resolve/main/flux1-dev.safetensors
if [ ! -f "$MODEL_DIR/vae/ultra_real_fine_tune.safetensors" ]; then
    wget -O sdxl_vae.safetensors "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors?download=true" -P "$Model_DIR/unet

fi

if [ ! -f "$MODEL_DIR/checkpoints/v1-5-pruned-emaonly-fp16.safetensors" ]; then
  wget -O v1-5-pruned-emaonly-fp16.safetensors "https://huggingface.co/Comfy-Org/stable-diffusion-v1-5-archive/resolve/main/v1-5-pruned-emaonly-fp16.safetensors?download=true" -P "$MODEL_DIR/checkpoints/"
fi



# add authorization header if needed
# if you have a Hugging Face token, uncomment the following line and replace YOUR_TOKEN with your actual token
# --header="Authorization Bearer YOUR_TOKEN" 
# if [ ! -f "$MODEL_DIR/vae/ae.safetensors" ]; then
#     wget -c https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors -P "$MODEL_DIR/vae/"
# fi

# echo "runpod-worker-comfy: Starting ComfyUI"
# python3 ./ComfyUI/main.py --disable-auto-launch --disable-metadata --listen &