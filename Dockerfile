FROM java:8-jre

MAINTAINER Stanley Förster <stanley.foerster@gmail.com>

ENV ARCHIVA_HOME /opt/apache-archiva
ENV ARCHIVA_BASE /opt/apache-archiva
ENV ARCHIVA_VERSION 2.2.3

WORKDIR ${ARCHIVA_HOME}

RUN \
    curl -sL --retry 10 --retry-delay 10 -o /tmp/apache-archiva.tgz http://apache.mirror.iphh.net/archiva/${ARCHIVA_VERSION}/binaries/apache-archiva-${ARCHIVA_VERSION}-bin.tar.gz && \
	tar xf /tmp/apache-archiva.tgz -C ${ARCHIVA_HOME} --strip-components=1 && \
	rm /tmp/apache-archiva.tgz

VOLUME ["${ARCHIVA_HOME}/logs", "${ARCHIVA_HOME}/data", "${ARCHIVA_HOME}/conf", "${ARCHIVA_HOME}/contexts", "${ARCHIVA_HOME}/repositories"]
EXPOSE 8080

ENTRYPOINT ["/opt/apache-archiva/bin/archiva", "console"]

