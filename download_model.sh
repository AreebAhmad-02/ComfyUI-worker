#!/bin/bash


MODEL_DIR=/runpod-volume/models/
mkdir -p $MODEL_DIR
chmod -R 777 /runpod-volume/models
# https://huggingface.co/realung/flux1-dev.safetensors/resolve/main/flux1-dev.safetensors
if [ ! -f "$MODEL_DIR/unet/ultra_real_fine_tune.safetensors" ]; then
    wget -O ultra_real_fine_tune.safetensors "https://civitai.com/api/download/models/1413133?type=Model&format=SafeTensor&size=full&fp=fp16&token=e66d7053db9dd30b2e7010d78bfbe43c" -P "$Model_DIR/unet

fi

if [ ! -f "$MODEL_DIR/loras/realism_amplifier.safetensors " ]; then
  wget -O realism_amplifier.safetensors "https://civitai.com/api/download/models/1351520?type=Model&format=SafeTensor&token=e66d7053db9dd30b2e7010d78bfbe43c" -P "$MODEL_DIR/loras/"
fi

if [ ! -f "$MODEL_DIR/loras/35mm_joycap.safetensors" ]; then
  wget -O 35mm_joycap.safetensors "https://civitai.com/api/download/models/774102?type=Model&format=SafeTensor&token=e66d7053db9dd30b2e7010d78bfbe43c" -P "$MODEL_DIR/loras/"
fi

if [ ! -f "$MODEL_DIR/loras/realism_amplifier.safetensors " ]; then
  wget -O realism_amplifier.safetensors "https://civitai.com/api/download/models/1351520?type=Model&format=SafeTensor&token=e66d7053db9dd30b2e7010d78bfbe43c" -P "$MODEL_DIR/loras/"
fi

if [ ! -f "$MODEL_DIR/loras/ultra-real_lora.safetensors" ]; then
   wget -O ultra-real_lora.safetensors "https://civitai.com/api/download/models/1881976?type=Model&format=SafeTensor&token=e66d7053db9dd30b2e7010d78bfbe43c" -P "$MODEL_DIR/loras/"
fi

if [ ! -f "$MODEL_DIR/loras/face_detailer.safetensors" ]; then
  wget -O face_detailer.safetensors "https://civitai.com/api/download/models/1875852?type=Model&format=SafeTensor&token=e66d7053db9dd30b2e7010d78bfbe43c"
 -P "$MODEL_DIR/loras/"
fi


if [ ! -f "$MODEL_DIR/loras/iphone_lora.safetensors" ]; then
  wget -O iphone_lora.safetensors "https://huggingface.co/sirioberati/NewLoRA349242/resolve/main/iPhone3423V3221.safetensors" -P "$MODEL_DIR/loras/"
fi


if [ ! -f "$MODEL_DIR/loras/realism_amplifier.safetensors " ]; then
  wget -O realism_amplifier.safetensors "https://civitai.com/api/download/models/1351520?type=Model&format=SafeTensor&token=e66d7053db9dd30b2e7010d78bfbe43c" -P "$MODEL_DIR/loras/"
fi

if [ ! -f "$MODEL_DIR/loras/realism_amplifier.safetensors " ]; then
  wget -O realism_amplifier.safetensors "https://civitai.com/api/download/models/1351520?type=Model&format=SafeTensor&token=e66d7053db9dd30b2e7010d78bfbe43c" -P "$MODEL_DIR/loras/"
fi


if [ ! -f "$MODEL_DIR/loras/hands_detailer.safetensors " ]; then
  wget -O hand_detailer.safetensors "https://civitai.green/api/download/models/1003317?type=Model&format=SafeTensor" -P "$MODEL_DIR/loras/"
fi

if [ ! -f "$MODEL_DIR/loras/flux_lora.safetensors " ]; then
  echo "Model flux_lora.safetensors does not exist, download link not given yet."
fi


if [ ! -f "$MODEL_DIR/clip/t5xxl_fp16.safetensors" ]; then
    wget -c https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors -P "$MODEL_DIR/clip/"
fi

if [ ! -f "$MODEL_DIR/clip/clip_l.safetensors" ]; then
    wget -c https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors -P "$MODEL_DIR/clip/"
fi



# add authorization header if needed
# if you have a Hugging Face token, uncomment the following line and replace YOUR_TOKEN with your actual token
# --header="Authorization Bearer YOUR_TOKEN" 
if [ ! -f "$MODEL_DIR/vae/ae.safetensors" ]; then
    wget -c https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors -P "$MODEL_DIR/vae/"
fi

# echo "runpod-worker-comfy: Starting ComfyUI"
# python3 ./ComfyUI/main.py --disable-auto-launch --disable-metadata --listen &