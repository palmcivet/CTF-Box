# Author: Palm Civet
# GitHub: https://github.com/Palmcivet

FROM ubuntu:20.04

ARG ISCTF=false
ENV DEBIAN_FRONTEND=noninteractive

COPY ./install /install

RUN cd /install \
    && chmod 755 install.sh \
    && ./install.sh ${ISCTF} \
    && rm -rf /install
