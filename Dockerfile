# syntax=docker/dockerfile:1

FROM ubuntu:22.04
RUN  apt-get update && apt-get install -y curl lsof \
     && curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash
RUN  /root/gaianet/bin/gaianet init;
COPY run.sh .
RUN  chmod +x run.sh

ENTRYPOINT ./run.sh "$@"