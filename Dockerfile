FROM gradle:jdk-alpine
LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

USER root
RUN apk add --no-cache git subversion mercurial wget curl unzip openssh ca-certificates procps bash && \
    rm -rf /var/cache/apk/*

RUN addgroup -S -g 10000 jenkins && \
    adduser -S -u 10000 -h /home/jenkins -G jenkins jenkins

ENV GRADLE_USER_HOME /home/jenkins/.gradle

USER jenkins
WORKDIR /home/jenkins

CMD ["/bin/sh"]
