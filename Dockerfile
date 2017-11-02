# ====================================================================== #
# Android SDK Docker Image for Jenkins
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM jenkins/jenkins:latest

ARG ANDROID_SDK_URL_FOR_LINUX=https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip

ENV ANDROID_HOME /usr/share/jenkins/ref/sdk

LABEL maintainer="Carlos Leonardo Camilo Vargas Huamán"

RUN mkdir -p $ANDROID_HOME

RUN curl -o $ANDROID_HOME/sdk.zip ${ANDROID_SDK_URL_FOR_LINUX}

RUN unzip -d $ANDROID_HOME $ANDROID_HOME/sdk.zip

RUN rm -rf $ANDROID_HOME/sdk.zip

RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-24" "emulator" "platform-tools" "platforms;android-24" "sources;android-24" "system-images;android-24;google_apis;armeabi-v7a" "tools"

RUN $ANDROID_HOME/tools/bin/avdmanager create avd -n Android_24_arm -k "system-images;android-24;google_apis;armeabi-v7a" | echo no


