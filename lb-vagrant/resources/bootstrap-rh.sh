#!/usr/bin/env bash

######################################################################################
#
######################################################################################

function install_tgz {
    rm -rf $1
    mkdir -p $1
    tar xvzf $2 --directory $1 --strip-components=1
}

function install_zip {
    rm -rf $1
    mkdir -p $2
    unzip $3 -d $2
}

function install_java {
    wget --quiet \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        --output-document=/tmp/${2} \
        http://download.oracle.com/otn-pub/java/jdk/${1}/${2}

    install_tgz /tmp/${2} $3

    rm -f /tmp/${2}
}

######################################################################################
#
######################################################################################

yum -y update
yum -y install unzip
yum -y install wget
yum -y install git

######################################################################################
#
######################################################################################

install_java 8u45-b14 jdk-8u45-linux-x64.tar.gz /opt/java/jdk-1.8.0
install_java 7u80-b15 jdk-7u80-linux-x64.tar.gz /opt/java/jdk-1.7.0

wget --quiet \
    --output-document=/tmp/maven.tar.gz \
    http://apache.fastbull.org/maven/maven-3/3.2.2/binaries/apache-maven-3.3.3-bin.tar.gz

wget --quiet \
    --output-document=/tmp/gradle.zip \
    https://services.gradle.org/distributions/gradle-2.4-bin.zip

wget --quiet \
    --output-document=/home/vagrant/.bashrc \
    https://github.com/lburgazzoli/lb-devops/blob/master/lb-vagrant/resources/bashrc-rh

install_tgz /opt/tools/maven /tmp/maven.tar.gz
install_zip /opt/tools/gradle /opt/tools /tmp/gradle.zip

rm -f /tmp/maven.tar.gz
rm -f /tmp/gradle.zip

