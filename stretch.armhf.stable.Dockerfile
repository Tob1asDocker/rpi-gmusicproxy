FROM balenalib/rpi-raspbian:stretch

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
	org.opencontainers.image.title="GMusicProxy" \
	org.opencontainers.image.description="Debian 9 Stretch with GMusicProxy on arm arch" \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-gmusicproxy" \
	org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-gmusicproxy"

ARG CROSS_BUILD_START=":"
ARG CROSS_BUILD_END=":"

RUN [ ${CROSS_BUILD_START} ]

ENV GMUSICPROXY_VERSION 1.0.8

RUN apt-get update && apt-get install -y \
	wget \
	build-essential \
	python2.7-dev \
	python-pip \
	python-setuptools \
	libffi-dev libssl-dev \
	libmagic-dev \
	libxml2-dev libxslt1-dev \
	python-lxml \
	python-docutils \
	--no-install-recommends && \
	rm -rf /var/lib/apt/lists/* && \
	pip --version && \
	python --version && \
	#pip install --upgrade pip && \
	wget https://github.com/gmusicproxy/gmusicproxy/archive/v${GMUSICPROXY_VERSION}.tar.gz && \
	tar -xzf v${GMUSICPROXY_VERSION}.tar.gz -C / && \
	mv /gmusicproxy-${GMUSICPROXY_VERSION} /app  && \
	cd /app && pip install --no-cache-dir -r requirements.txt

#COPY gmusicproxy.cfg /root/.config/gmusicproxy.cfg
#WORKDIR /app

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]

RUN [ ${CROSS_BUILD_END} ]