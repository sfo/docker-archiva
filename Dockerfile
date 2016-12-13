FROM java:7-jre

MAINTAINER Stanley Förster <stanley.foerster@gmail.com>

ENV ARCHIVA_HOME /opt/apache-archiva
ENV ARCHIVA_BASE /var/apache-archiva
ENV ARCHIVA_CONTEXT_PATH /

WORKDIR ${ARCHIVA_HOME}
COPY run.sh .

RUN \
	curl -sL --retry 10 --retry-delay 10 -o /tmp/apache-archiva.tgz http://apache.mirror.iphh.net/archiva/2.2.1/binaries/apache-archiva-2.2.1-bin.tar.gz && \
	tar xf /tmp/apache-archiva.tgz -C ${ARCHIVA_HOME} --strip-components=1 && \
	rm /tmp/apache-archiva.tgz

VOLUME ["${ARCHIVA_BASE}"]
EXPOSE 8080

CMD ["/opt/apache-archiva/run.sh"]

