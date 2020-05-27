FROM python:3.8-slim-buster

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
    org.opencontainers.image.title="GMusicProxy" \
    org.opencontainers.image.description="Debian 10 Buster with GMusicProxy (latest) on x86_64 arch" \
    org.opencontainers.image.licenses="GPL-3.0" \
    org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-gmusicproxy" \
    org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-gmusicproxy"

RUN set -ex \
    && apt-get update && apt-get install -y --no-install-recommends \
       git \
       libxml2-dev libxslt1-dev zlib1g-dev gcc \
    && rm -rf /var/lib/apt/lists/* \
    && python --version \
    && pip --version \
    && git clone https://github.com/gmusicproxy/gmusicproxy.git /usr/src/app \
    && cd /usr/src/app \
    && rm -r .git \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get purge --auto-remove -y libxml2-dev libxslt1-dev zlib1g-dev gcc git

WORKDIR /usr/src/app

VOLUME ["/root/.local/share/gmusicapi"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]