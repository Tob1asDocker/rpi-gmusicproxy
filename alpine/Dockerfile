FROM resin/raspberry-pi-alpine:3.8

MAINTAINER Tobias Hargesheimer <docker@ison.ws>

RUN [ "cross-build-start" ]

RUN set -x && apk --no-cache add \ 
	alpine-sdk \
	python2-dev \
	py2-pip \
	py-setuptools \
	py2-lxml \
	py2-docutils \
	libxslt-dev \
	libffi-dev openssl-dev \
	libmagic \
	&& pip --version \
	&& python --version \
	#&& pip install --upgrade pip \
	&& git clone https://github.com/gmusicproxy/gmusicproxy.git app/ \
	&& cd /app && pip install --no-cache-dir -r requirements.txt
	
#COPY gmusicproxy.cfg /root/.config/gmusicproxy.cfg
#WORKDIR /app

RUN [ "cross-build-end" ]

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]