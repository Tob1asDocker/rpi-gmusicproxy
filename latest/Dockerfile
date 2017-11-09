FROM resin/rpi-raspbian:stretch

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y \
	git \
	build-essential \
	python2.7-dev \
	python-pip \
	python-setuptools \
	libffi-dev libssl-dev \
	libmagic-dev \
	libxml2-dev libxslt1-dev \
	--no-install-recommends && \
	rm -rf /var/lib/apt/lists/* && \
	pip --version && \
	python --version && \
	git clone https://github.com/diraimondo/gmusicproxy.git app/ && \
	apt-get remove --purge git git-man libcurl3-gnutls liberror-perl && apt-get clean && \
	cd /app && pip install --no-cache-dir -r requirements.txt

#COPY gmusicproxy.cfg /root/.config/gmusicproxy.cfg
#WORKDIR /app

RUN [ "cross-build-end" ]

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]
