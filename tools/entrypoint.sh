#!/bin/bash

function checkbin() {
    type -P su-exec
}

function su_mt_user() {
    su android -c '"$0" "$@"' -- "$@"
}

chown android:android /opt/android-sdk-linux

printenv

if checkbin; then
    exec su-exec android:android /opt/tools/android-sdk-update.sh "$@"
else
    su_mt_user /opt/tools/android-sdk-update.sh ${1}
fi

update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
mkdir -p /opt/firebase
wget -o /opt/firebase/firebase_tools https://firebase.tools/bin/linux/latest
chmod +x /opt/firebase/firebase_tools
wget -o /opt/gradle-5.6.4-bin.zip https://services.gradle.org/distributions/gradle-5.6.4-bin.zip
unzip -d /opt/ /opt/gradle-5.6.4-bin.zip
mv /opt/gradle-5.6.4 /opt/gradle
rm /opt/gradle-5.6.4-bin.zip
gem install fastlane
bundle update
chmod +x /opt/firebase/firebase_tools
echo "PATH=$PATH:/opt/gradle/bin:/opt/firebase" >> ~/.bashrc
source ~/.bashrc
