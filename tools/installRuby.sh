#!/bin/bash

update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
mkdir -p /opt/firebase
wget https://services.gradle.org/distributions/gradle-5.6.4-bin.zip
unzip -d /opt/ gradle-5.6.4-bin.zip
mv /opt/gradle-5.6.4 /opt/gradle
rm gradle-5.6.4-bin.zip
echo "PATH=$PATH:/opt/gradle/bin" >> ~/.bashrc
source ~/.bashrc
gem install fastlane bundle