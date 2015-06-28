#!/usr/bin/env bash

######################################################################################
#
######################################################################################

function get {
    wget --quiet --output-document=$2 $1
}

function install_tgz {
    rm -rf $1
    mkdir -p $1
    tar xvzf $2 --directory $1 --strip-components=1
}

function install_java {
    JAVA_VERSION_MAJOR=$1
    JAVA_VERSION_MINOR=$2
    JAVA_VERSION_BUILD=$3
    
    JAVA_BUILD="${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}"
    JAVA_ARCHIVE="jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz"

    wget --quiet \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        --output-document=/tmp/${JAVA_ARCHIVE} \
        http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_ARCHIVE}

    install_tgz /opt/java/${4} /tmp/${JAVA_ARCHIVE} /opt/java/${4}

    rm -f /tmp/${JAVA_ARCHIVE}
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

if [ ! -d /opt/tools ]; then
    mkdir -p /opt/tools
fi

if [ ! -d /opt/java ]; then
    mkdir -p /opt/java
fi

JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 45
ENV JAVA_VERSION_BUILD 14

install_java 8 45 14 jdk-1.8.0
install_java 7 80 15 jdk-1.7.0

V_MAVEN=3.3.3
V_GRADLE=2.4

get http://apache.fastbull.org/maven/maven-3/${V_MAVEN}/binaries/apache-maven-${V_MAVEN}-bin.tar.gz /tmp/maven-${V_MAVEN}.tar.gz
get https://services.gradle.org/distributions/gradle-${V_GRADLE}-bin.zip /tmp/gradle-${V_GRADLE}.zip
get https://raw.githubusercontent.com/lburgazzoli/lb-devops/master/lb-vagrant/resources/bashrc-rh /home/vagrant/.bashrc

install_tgz /opt/tools/maven /tmp/maven-${V_MAVEN}.tar.gz

rm -rf /opt/tools/gradle
unzip /tmp/gradle-${V_GRADLE}.zip -d /opt/tools
mv /opt/tools/gradle-${V_GRADLE} /opt/tools/gradle

rm -f /tmp/maven-${V_MAVEN}.tar.gz
rm -f /tmp/gradle-${V_GRADLE}.zip
