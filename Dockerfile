FROM fedora:latest

RUN dnf install -y \
  wget \
  fuse \
  vim \
  && dnf clean all

RUN mkdir -p /extras
RUN wget -P /extras -q https://github.com/kahing/goofys/releases/download/v0.24.0/goofys
RUN wget -P /extras -q https://github.com/kahing/catfs/releases/download/v0.8.0/catfs
RUN chmod +x -v /extras/*

ENV PATH /extras:$PATH

WORKDIR /root

ENTRYPOINT /bin/bash
