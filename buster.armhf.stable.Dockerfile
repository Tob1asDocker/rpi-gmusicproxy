FROM arm32v7/python:3.8-slim-buster

LABEL org.opencontainers.image.authors="Tobias Hargesheimer <docker@ison.ws>" \
    org.opencontainers.image.title="GMusicProxy" \
    org.opencontainers.image.description="Debian 10 Buster with GMusicProxy (stable) on arm arch" \
    org.opencontainers.image.licenses="GPL-3.0" \
    org.opencontainers.image.url="https://hub.docker.com/r/tobi312/rpi-gmusicproxy" \
    org.opencontainers.image.source="https://github.com/Tob1asDocker/rpi-gmusicproxy"

#ENV GMUSICPROXY_VERSION 2.2.1

RUN set -ex \
    && apt-get update && apt-get install -y --no-install-recommends \
       wget \
       libxml2-dev libxslt1-dev zlib1g-dev gcc \
    && rm -rf /var/lib/apt/lists/* \
    && python --version \
    && pip --version \
    && GMUSICPROXY_VERSION=$(wget -qO- https://api.github.com/repos/gmusicproxy/gmusicproxy/releases/latest | grep 'tag_name' | cut -d\" -f4 | tr -d v) && echo "GMUSICPROXY_VERSION=${GMUSICPROXY_VERSION}" \
    && wget -qO- https://github.com/gmusicproxy/gmusicproxy/archive/v${GMUSICPROXY_VERSION}.tar.gz | tar -xzf - -C /usr/src/ \
    && mv /usr/src/gmusicproxy-${GMUSICPROXY_VERSION} /usr/src/app \
    && cd /usr/src/app \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get purge --auto-remove -y libxml2-dev libxslt1-dev zlib1g-dev gcc wget

WORKDIR /usr/src/app

VOLUME ["/root/.local/share/gmusicapi"]
EXPOSE 9999/tcp
ENTRYPOINT ["GMusicProxy"]