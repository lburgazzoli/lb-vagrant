############################################################
# Debian Jessie / go 1.4
############################################################

FROM lb/debian-jessie
MAINTAINER lburgazzoli

ENV http_proxy http://172.17.42.1:8128
ENV https_proxy http://172.17.42.1:8128

RUN \
    wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz -O /tmp/go.tar.gz && \
    mkdir -p /opt/goroot && \
    mkdir -p /opt/gopath && \
    tar xzf /tmp/go.tar.gz --directory /opt/goroot --strip-components=1 && \
    rm -rf /tmp/go.tar.gz

ENV GOROOT /opt/goroot
ENV GOPATH /opt/gopath
ENV PATH /opt/goroot/bin:/opt/gopath/bin:$PATH
