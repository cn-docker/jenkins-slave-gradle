FROM gradle:jdk-alpine
LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

USER root
RUN apk add --no-cache git subversion mercurial wget curl unzip openssh ca-certificates procps && \
    rm -rf /var/cache/apk/*

RUN mkdir /ws
WORKDIR /ws

CMD ["/bin/sh"]
