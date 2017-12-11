# Jenkins Slave Gradle #

Jenkins Slave for Gradle builds. Docker image based on Gradle official image.

## Tools Installed ##

- Gradle
- Open Java JDK 8
- Git
- Mercurial
- Subversion
- wget
- curl
- unzip
- OpenSSH
- CA Certificates

## Add certificate to connect to HTTPS repositories

To add custom certificates and root CAs, create a new Dockerfile and import them with the following code.

	FROM jnonino/jenkins-slave-gradle
	LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

	# Trust Root CA
	COPY Root_CA.crt /tmp
	RUN cp /tmp/Root_CA.crt /usr/local/share/ca-certificates/ && \
		chmod 644 /usr/local/share/ca-certificates/Root_CA.crt && \
		update-ca-certificates

	CMD ["/bin/bash"]