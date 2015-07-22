############################################################
# CentOS 7 
############################################################

FROM centos:7
MAINTAINER lburgazzoli

ENV http_proxy http://172.17.42.1:8128
ENV https_proxy http://172.17.42.1:8128

#RUN yum -y install sudo
#RUN yum -y install subversion

RUN \
    yum -y update && \
    yum -y install \ 
        wget \
        curl \
        tar \
        git \
        libaio && \
    yum -y clean all

