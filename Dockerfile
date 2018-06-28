FROM ubuntu:xenial

# docker compose
RUN apt-get update && apt-get install -y \
    curl \ 
    ca-certificates \ 
    libltdl7 \
    binutils-dev \
    binutils-aarch64-linux-gnu \
    build-essential \
    gcc-aarch64-linux-gnu \
    genisoimage \
    liblzma-dev \
    syslinux \
    tree
RUN apt-get update

CMD [ '/bin/bash' ]