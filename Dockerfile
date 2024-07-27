# syntax=docker/dockerfile:1

FROM --platform=linux/amd64 ubuntu:22.04
RUN apt-get update && apt-get install -y curl lsof && apt-get install --only-upgrade curl openssl \
    && curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash
RUN echo 'insecure' >> ~/.curlrc && rm -rf /root/gaianet/qdrant/storage/* && rm -rf /root/gaianet/qdrant/snapshots/* && /root/gaianet/bin/gaianet init
COPY run.sh .
RUN chmod +x run.sh

ENTRYPOINT ./run.sh "$@"
