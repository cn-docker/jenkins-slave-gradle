FROM openjdk:8-jdk-alpine
LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

USER root
RUN apk add --no-cache git subversion mercurial wget curl unzip openssh ca-certificates procps bash && \
    rm -rf /var/cache/apk/*

# Install Gradle
RUN echo "Install Gradle 2.5" && \
    wget https://downloads.gradle.org/distributions/gradle-2.5-bin.zip && \
    unzip gradle-2.5-bin.zip && \
    mkdir /opt && \
    mv gradle-2.5 /opt/gradle && \
    rm -rf gradle-2.5-bin.zip
ENV GRADLE_HOME /opt/gradle
ENV PATH $GRADLE_HOME/bin:$PATH

# Install GLibC
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.26-r0/glibc-2.26-r0.apk && \
    apk add --allow-untrusted glibc-2.26-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.26-r0/glibc-bin-2.26-r0.apk && \
    apk add --allow-untrusted glibc-bin-2.26-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.26-r0/glibc-dev-2.26-r0.apk && \
    apk add --allow-untrusted glibc-dev-2.26-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.26-r0/glibc-i18n-2.26-r0.apk && \
    apk add --allow-untrusted glibc-i18n-2.26-r0.apk

RUN mkdir /ws && \
    chmod 777 /ws
WORKDIR /ws

CMD ["/bin/sh"]
