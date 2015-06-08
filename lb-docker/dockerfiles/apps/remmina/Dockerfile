FROM ubuntu:vivid
MAINTAINER lb

ENV http_proxy http://172.17.42.1:8128
ENV https_proxy http://172.17.42.1:8128

RUN apt-get update && apt-get install -y \
    software-properties-common \
    --no-install-recommends && \
    apt-add-repository ppa:remmina-ppa-team/remmina-next && \
    apt-get update && apt-get install -y \
    hicolor-icon-theme \
    remmina \
    remmina-plugin-rdp \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "remmina" ]
