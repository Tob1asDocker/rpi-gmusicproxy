FROM resin/raspberry-pi-alpine:3.6

MAINTAINER Tobias Hargesheimer <docker@ison.ws>

RUN [ "cross-build-start" ]

RUN set -x && apk --no-cache add \ 
	alpine-sdk \
	python2-dev \
	py2-pip \
	py-setuptools \
	libffi-dev openssl-dev \
	libmagic \
	&& pip --version \
	&& python --version \
	&& git clone https://github.com/diraimondo/gmusicproxy.git app/ \
	&& cd /app && pip install --no-cache-dir -r requirements.txt
	
#COPY gmusicproxy.cfg /root/.config/gmusicproxy.cfg
#WORKDIR /app

RUN [ "cross-build-end" ]

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]