FROM jenkins/jenkins:latest

MAINTAINER Carlos Leonardo Camilo Vargas Huamán <carlosleonardovargashuaman@gmail.com>

USER root

RUN apt-get update && apt-get install

#USER jenkins

ARG ANDROID_SDK_URL_FOR_LINUX=https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip

ENV ANDROID_HOME /var/jenkins_home/sdk

RUN mkdir -p $ANDROID_HOME

RUN curl -o $ANDROID_HOME ${ANDROID_SDK_URL_FOR_LINUX}

#RUN unzip -d $ANDROID_HOME $ANDROID_HOME/sdk.zip

#RUN rm -rf $ANDROID_HOME/sdk.zip

#RUN




# ====================================================================== #
# Android SDK Docker Image for Jenkins
# ====================================================================== #
#
# Base image
# ---------------------------------------------------------------------- #
#FROM jenkins/jenkins:latest
#
#ARG ANDROID_SDK_URL_FOR_LINUX=https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
#
#ENV ANDROID_HOME /usr/share/jenkins/ref/sdk
#
#LABEL maintainer="Carlos Leonardo Camilo Vargas Huamán"
#
#VOLUME android_sdk
#
#RUN mkdir -p $ANDROID_HOME
#
#RUN curl -o $ANDROID_HOME/sdk.zip ${ANDROID_SDK_URL_FOR_LINUX}
#
#RUN unzip -d $ANDROID_HOME $ANDROID_HOME/sdk.zip
#
#RUN rm -rf $ANDROID_HOME/sdk.zip
#
#RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;27.0.1" "emulator" "tools" "extras;android;m2repository" "extras;google;m2repository"
#RUN $ANDROID_HOME/tools/bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2" "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2"
#RUN $ANDROID_HOME/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "system-images;android-24;google_apis;armeabi-v7a"
