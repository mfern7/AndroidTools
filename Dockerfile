FROM ubuntu:18.04

LABEL nogala.android-docker.flavour="ubuntu-standalone"

ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux
ENV GRADLE_HOME /opt/gradle
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
ENV MAVEN_HOME /usr/share/maven

ENV DEBIAN_FRONTEND noninteractive

# Install required tools
# Dependencies to execute Android builds

RUN dpkg --add-architecture i386 && apt-get update -yqq && apt-get install -y \
  curl \
  expect \
  git \
  make \
  build-essential \
  libc6:i386 \
  libgcc1:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  libgmp-dev \
  libc6-dev \
  zlib1g:i386 \
  openjdk-8-jdk \
  wget \
  unzip \
  nano \
  openssh-client \
  locales \
  nodejs \
  npm \
  maven \
  ruby-full \
  ruby-dev \
  ruby \
  dh-autoreconf \
  && apt-get clean

RUN rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.UTF-8

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android -u 1000 android

COPY tools /opt/tools

COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in

CMD /opt/tools/entrypoint.sh built-in
