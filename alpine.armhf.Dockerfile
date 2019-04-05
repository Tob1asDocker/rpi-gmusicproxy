FROM balenalib/raspberry-pi-alpine:3.9

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
	org.opencontainers.image.title="GMusicProxy" \
	org.opencontainers.image.description="AlpineLinux with GMusicProxy on arm arch" \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-gmusicproxy" \
	org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-gmusicproxy"

ARG CROSS_BUILD_START=":"
ARG CROSS_BUILD_END=":"

RUN [ ${CROSS_BUILD_START} ]

RUN set -x && apk --no-cache add \ 
	alpine-sdk \
	python2-dev \
	py2-pip \
	py-setuptools \
	py2-lxml \
	#py2-docutils \
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

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]

RUN [ ${CROSS_BUILD_END} ]