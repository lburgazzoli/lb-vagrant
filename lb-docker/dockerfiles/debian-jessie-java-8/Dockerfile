FROM lb/debian-jessie
MAINTAINER lb

ENV http_proxy http://172.17.42.1:8128
ENV https_proxy http://172.17.42.1:8128

RUN \
    wget \
    --quiet \
    --no-cookies \
    --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz" \
    -O /tmp/jdk-8-linux-x64.tar.gz

RUN mkdir -p /opt/java
RUN tar xzf /tmp/jdk-8-linux-x64.tar.gz --directory /opt/java --strip-components=1
RUN rm -f /tmp/jdk-8-linux-x64.tar.gz

ENV JAVA_HOME /opt/java
ENV PATH /opt/java/bin:$PATH
