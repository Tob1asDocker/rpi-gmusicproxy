FROM resin/rpi-raspbian:stretch

ENV GMUSICPROXY_VERSION 1.0.8

RUN [ "cross-build-start" ]

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

RUN [ "cross-build-end" ]

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]
