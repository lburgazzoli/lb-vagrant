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

wget --quiet \
    --no-check-certificate \
    --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    --output-document=/tmp/jdk-1.8.0_11.tar.gz \
    http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-i586.tar.gz

wget --quiet \
    --no-check-certificate \
    --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    --output-document=/tmp/jdk-1.7.0_67.tar.gz \
    http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-i586.tar.gz

wget --quiet \
    --output-document=/tmp/maven-3.2.2.tar.gz \
    http://apache.fastbull.org/maven/maven-3/3.2.2/binaries/apache-maven-3.2.2-bin.tar.gz

wget --quiet \
    --output-document=/tmp/gradle-2.0.zip \
    https://services.gradle.org/distributions/gradle-2.0-bin.zip

install_tgz /opt/java/jdk-1.8.0_11 /tmp/jdk-1.8.0_11.tar.gz
install_tgz /opt/java/jdk-1.7.0_67 /tmp/jdk-1.7.0_67.tar.gz
install_tgz /opt/tools/maven-3.2.2 /tmp/maven-3.2.2.tar.gz
install_zip /opt/tools/gradle-2.0 /opt/tools /tmp/gradle-2.0.zip

rm -f /tmp/jdk-1.8.0_11.tar.gz
rm -f /tmp/jdk-1.7.0_67.tar.gz
rm -f /tmp/maven-3.2.2.tar.gz
rm -f /tmp/gradle-2.0.zip

cp /vagrant/bashrc /home/vagrant/.bashrc
