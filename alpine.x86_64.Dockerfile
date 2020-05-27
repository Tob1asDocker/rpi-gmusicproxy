FROM python:3.8-alpine

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
    org.opencontainers.image.title="GMusicProxy" \
    org.opencontainers.image.description="AlpineLinux with GMusicProxy (latest) on x86_64 arch" \
    org.opencontainers.image.licenses="GPL-3.0" \
    org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-gmusicproxy" \
    org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-gmusicproxy"

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
       git \
	   libxml2-dev libxslt-dev zlib-dev gcc \
	   build-base libffi-dev openssl-dev libc-dev libmagic linux-headers \
    && python --version \
    && pip --version \
    && git clone https://github.com/gmusicproxy/gmusicproxy.git /usr/src/app \
    && cd /usr/src/app \
    && rm -r .git \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del --no-network --purge .build-deps
	
WORKDIR /usr/src/app

VOLUME ["/root/.local/share/gmusicapi"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]