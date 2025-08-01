    FROM runpod/worker-comfyui:5.2.0-base

    # Install required ComfyUI nodes for upscaling workflow
    RUN comfy-node-install rgthree-comfy

    # Set Hugging Face cache directory to persistent volume
    ENV HF_HOME=/runpod-volume/models/huggingface

    # # Create LLaVA checkpoint directory and symlink it into ComfyUI's path
    # RUN mkdir -p /runpod-volume/models/LLavacheckpoints && \
    #     rm -rf /comfyui/models/LLavacheckpoints && \
    #     ln -s /runpod-volume/models/LLavacheckpoints /comfyui/models/LLavacheckpoints

    # replace extra_models_path.yaml with ultra realistic workflow
    RUN ls /
    RUN ls /comfyui
    RUN rm -f /comfyui/extra_model_paths.yaml
    ADD extra_model_paths.yaml /comfyui/extra_model_paths.yaml
    ADD test_input.json /comfyui/test_input.json
    ADD download_model.sh /
    RUN chmod +x /download_model.sh
    # CMD ["/bin/bash", "-c", "/download_model.sh && /start.sh"]