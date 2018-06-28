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
    iproute2 \
    liblzma-dev \
    syslinux \
    tree \
    wget 

RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
RUN dpkg -i puppetlabs-release-pc1-xenial.deb
RUN apt-get update
RUN apt-get install pdk

RUN curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

RUN apt-get update

CMD [ '/bin/bash' ]