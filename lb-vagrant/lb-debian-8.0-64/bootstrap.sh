#!/usr/bin/env bash

######################################################################################
#
######################################################################################

function install_tgz {
    rm -rf $1
    mkdir -p $1
    tar xvzf $2 --directory $1 --strip-components=1
    rm -f $2
}

function install_zip {
    rm -rf $1
    mkdir -p $2
    unzip $3 -d $2
    rm -f $3
}

function get_java {
    wget --quiet \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        --output-document=/tmp/jdk-${1}.${2}.0_${3}.tar.gz \
        http://download.oracle.com/otn-pub/java/jdk/${2}u${3}-b${4}/jdk-${2}u${3}-linux-x64.tar.gz

    install_tgz /opt/java/jdk-${1}.${2}.0_${3} /tmp/jdk-${1}.${2}.0_${3}.tar.gz
    rm -f /tmp/jdk-${1}.${2}.0_${3}.tar.gz
}


######################################################################################
#
######################################################################################

apt-get update
apt-get install python-software-properties
apt-get install unzip
apt-get install wget
apt-get install git

######################################################################################
#
######################################################################################

get_java 1 8 40 26
get_java 1 7 76 13

wget --quiet \
    --output-document=/tmp/maven-3.2.5.tar.gz \
    http://apache.fastbull.org/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz

wget --quiet \
    --output-document=/tmp/gradle-2.3.zip \
    https://services.gradle.org/distributions/gradle-2.3-bin.zip

install_tgz /opt/tools/maven-3.2.5 /tmp/maven-3.2.5.tar.gz
install_zip /opt/tools/gradle-2.3 /opt/tools /tmp/gradle-2.3.zip

cp /vagrant/bashrc ~/.bashrc
