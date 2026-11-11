# Image for Hebrew audio transcription on a rented GPU (vast.ai).
# Contains software only (no model weights); weights are downloaded from Hugging Face at run time.
FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1 \
    HF_HUB_ENABLE_HF_TRANSFER=1

RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 python3-pip ffmpeg openssh-server ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# faster-whisper brings ctranslate2; hf_transfer speeds up the model download.
RUN pip3 install --upgrade pip \
 && pip3 install faster-whisper huggingface_hub hf_transfer

WORKDIR /root
