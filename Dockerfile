#FROM resin/raspberrypi2-python:2.7
FROM tobi312/rpi-raspberrypi2-python:2.7

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y \
	git \
	--no-install-recommends && \
	rm -rf /var/lib/apt/lists/* && \
	git clone https://github.com/diraimondo/gmusicproxy.git app/ && \
	apt-get remove --purge git && apt-get clean && \
	cd /app && pip install --no-cache-dir -r requirements.txt

#COPY gmusicproxy.cfg /root/.config/gmusicproxy.cfg
#WORKDIR /app

RUN [ "cross-build-end" ]

VOLUME ["/root/.config"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]
