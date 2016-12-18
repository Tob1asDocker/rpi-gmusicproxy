#FROM resin/raspberrypi2-python:2.7
FROM tobi312/rpi-raspberrypi2-python-qemu:2.7

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y \
	wget \
	--no-install-recommends && \
	rm -rf /var/lib/apt/lists/* 

ENV GMUSICPROXY_VERSION 1.0.5

RUN wget https://github.com/diraimondo/gmusicproxy/archive/v${GMUSICPROXY_VERSION}.tar.gz && \
	tar -xzf v${GMUSICPROXY_VERSION}.tar.gz -C / && \
	mv /gmusicproxy-${GMUSICPROXY_VERSION} /app  && \
	cd /app && pip install --no-cache-dir -r requirements.txt

#COPY gmusicproxy.cfg /root/.config/gmusicproxy.cfg
#WORKDIR /app

RUN [ "cross-build-end" ]

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]
