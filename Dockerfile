# Author: Palm Civet
# GitHub: https://github.com/Palmcivet/CTF-Box

FROM ubuntu:20.04

COPY ./install /install

RUN cd /install \
    && dpkg --add-architecture i386 \
    && cp config/sources.list /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    && chmod 755 install.sh \
    && ./install.sh \
    && rm -rf /install
