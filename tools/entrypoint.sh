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

mkdir -P /opt/gradle
wget https://services.gradle.org/distributions/gradle-5.6.4-all.zip
unzip -d /opt/gradle gradle-5.6.4-all.zip
echo "PATH=$PATH:/opt/gradle/gradle-5.6.4/bin" >> ~/.bashrc
