FROM ubuntu:xenial
ENV DOCKER_VERSION=17.12.1-ce

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

RUN curl -SL -o ./docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
    && tar xzvf ./docker.tgz \
    && cp ./docker/docker /usr/local/bin \
    && rm -r ./docker \
    && rm ./docker.tgz

RUN curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
RUN chmod +x /usr/bin/docker-compose


RUN apt-get update

CMD ["/bin/bash"]