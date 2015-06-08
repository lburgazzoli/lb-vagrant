FROM debian:jessie
MAINTAINER lb

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

RUN \
    wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz -O /tmp/go.tar.gz && \
    mkdir -p /opt/goroot && \
    mkdir -p /opt/gopath && \
    tar xzf /tmp/go.tar.gz --directory /opt/goroot --strip-components=1 && \
    rm -rf /tmp/go.tar.gz

ENV GOROOT /opt/goroot
ENV GOPATH /opt/gopath
ENV PATH /opt/goroot/bin:/opt/gopath/bin:$PATH
