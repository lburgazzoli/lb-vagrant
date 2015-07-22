############################################################
# Debian Jessie 
############################################################

FROM debian:jessie
MAINTAINER lburgazzoli

ENV http_proxy http://172.17.42.1:8128
ENV https_proxy http://172.17.42.1:8128

RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install --no-install-recommends -y build-essential && \
    apt-get install --no-install-recommends -y ca-certificates && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-get install --no-install-recommends -y curl git unzip wget && \   
    rm -rf /var/lib/apt/lists/*
