FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get -y install \
    build-essential \
    python \
    vim \
    tmux \
    docker \
    curl \
    git \
    tar \
    sudo \
    ca-certificates \
    openssl \
    subversion \
    && \
    apt-get clean

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.10.3
ENV DOCKER_SHA256 d0df512afa109006a450f41873634951e19ddabf8c7bd419caeb5a526032d86d

RUN curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION" -o /usr/local/bin/docker \
    && echo "${DOCKER_SHA256}  /usr/local/bin/docker" | sha256sum -c - \
    && chmod +x /usr/local/bin/docker

RUN adduser --disabled-password --gecos '' gdev && \
    adduser gdev sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    mkdir -p /home/gdev/bin /home/gdev/lib

ENV PATH /home/gdev/bin:$PATH
ENV LD_LIBRARY_PATH /home/gdev/lib:$LD_LIBRARY_PATH
ENV HOME /home/gdev
ENV TERM xterm-256color

ADD .bashrc /home/gdev/.bashrc
ADD .inputrc /home/gdev/.inputrc
ADD .vimrc /home/gdev/.vimrc
ADD .tmux.conf /home/gdev/.tmux.conf

WORKDIR /home/gdev
RUN chown -R gdev: /home/gdev
USER gdev

RUN (export VIM_HEADLESS_PLUGIN_INSTALL=1 ; \
    git clone https://github.com/VundleVim/Vundle.vim.git /home/gdev/.vim/bundle/Vundle.vim && \
    vim -i NONE -c VundleUpdate -c quitall)

RUN git clone https://github.com/tmux-plugins/tpm /home/gdev/.tmux/plugins/tpm && \
    /home/gdev/.tmux/plugins/tpm/bin/install_plugins


CMD ["/bin/bash"]
