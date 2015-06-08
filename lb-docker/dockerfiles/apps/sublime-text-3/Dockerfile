FROM ubuntu:vivid
MAINTAINER lb

ENV http_proxy http://172.17.42.1:8128
ENV https_proxy http://172.17.42.1:8128

ADD http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3092_amd64.deb /src/sublime-text_current_amd64.deb

RUN apt-get update && apt-get -y install \
    ca-certificates \
    curl \
    tar \
    bzip2 \
    libglib2.0-0 \
    libx11-6 \
    libcairo2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgtk2.0-0 \
    --no-install-recommends && \
    dpkg -i '/src/sublime-text_current_amd64.deb' \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/* 

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

# Autorun chrome
ENTRYPOINT [ "/opt/sublime_text/sublime_text" , "-w" ]
