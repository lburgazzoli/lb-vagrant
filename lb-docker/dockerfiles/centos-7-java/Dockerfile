############################################################
# CentOS 7 
# Oracle Java 1.7
# Oracle Java 1.8
############################################################

FROM centos:7
MAINTAINER lburgazzoli

RUN yum -y update
RUN yum -y install wget curl tar sudo
RUN yum -y install subversion git

RUN wget \
    --quiet \
    --no-cookies \
    --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz" \
    -O jdk-7-linux-x64.tar.gz

RUN wget \
    --quiet \
    --no-cookies \
    --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz" \
    -O jdk-8-linux-x64.tar.gz

RUN mkdir -p /opt/java/1.7.0
RUN mkdir -p /opt/java/1.8.0
RUN tar xzf jdk-7-linux-x64.tar.gz --directory /opt/java/1.7.0 --strip-components=1
RUN tar xzf jdk-8-linux-x64.tar.gz --directory /opt/java/1.8.0 --strip-components=1

RUN echo "export JAVA_HOME_7=/opt/java/1.7.0" >  /etc/profile.d/java.sh
RUN echo "export JAVA_HOME_8=/opt/java/1.8.0" >> /etc/profile.d/java.sh

# Cleanup
RUN rm -f jdk-7-linux-x64.tar.gz
RUN rm -f jdk-8-linux-x64.tar.gz

