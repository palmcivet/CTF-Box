# Author: Palm Civet
# GitHub: https://github.com/Palmcivet/light-security

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

COPY ./install /install

RUN cd /install \
    && chmod 755 install.sh \
    && ./install.sh \
    && rm -rf /install
