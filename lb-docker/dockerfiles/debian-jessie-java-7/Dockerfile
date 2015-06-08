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
    apt-get install --no-install-recommends -y curl git unzip wget 
    rm -rf /var/lib/apt/lists/*

RUN \
    wget \
    --quiet \
    --no-cookies \
    --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz" \
    -O /tmp/jdk-7-linux-x64.tar.gz

RUN mkdir -p /opt/java
RUN tar xzf /tmp/jdk-7-linux-x64.tar.gz --directory /opt/java --strip-components=1
RUN rm -f /tmp/jdk-7-linux-x64.tar.gz

ENV JAVA_HOME /opt/java
ENV PATH /opt/java/bin:$PATH
