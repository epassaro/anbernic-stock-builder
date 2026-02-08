FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    crossbuild-essential-arm64 \
    git \
    autoconf \
    automake \
    pkg-config \
    python3 \
    curl

RUN dpkg --add-architecture arm64 && \
    sed -i 's/deb http/deb [arch=amd64] http/g' /etc/apt/sources.list && \
    echo "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports jammy main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports jammy-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    apt-get update

RUN apt-get install -y \
    libsdl2-dev:arm64 \
    libsdl2-net-dev:arm64 \
    libsdl2-mixer-dev:arm64 \
    libsdl2-image-dev:arm64 \
    libsamplerate0-dev:arm64

ENV CC=aarch64-linux-gnu-gcc
ENV CXX=aarch64-linux-gnu-g++
ENV PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig

WORKDIR /workdir

ENTRYPOINT ["/bin/bash", "build.sh"]
