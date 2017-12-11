FROM gradle:jdk-alpine
LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

USER root
RUN apk add --no-cache git openssh subversion mercurial wget curl unzip && \
    rm -rf /var/cache/apk/*

RUN mkdir /ws
WORKDIR /ws

CMD ["/bin/sh"]
