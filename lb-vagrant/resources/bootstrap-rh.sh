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
    wget --quiet \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        --output-document=/tmp/${2} \
        http://download.oracle.com/otn-pub/java/jdk/${1}/${2}

    install_tgz /opt/java/${3} /tmp/${2} /opt/java/${3}

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

if [ ! -d /opt/tools ]; then
    mkdir -p /opt/tools
fi

if [ ! -d /opt/java ]; then
    mkdir -p /opt/java
fi

install_java 8u45-b14 jdk-8u45-linux-x64.tar.gz jdk-1.8.0
install_java 7u80-b15 jdk-7u80-linux-x64.tar.gz jdk-1.7.0

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
