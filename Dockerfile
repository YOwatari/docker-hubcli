FROM debian

ARG VERSION=2.5.1

RUN set -x \
  && apt-get update \
  && apt-get -y install curl git \
  && rm -rf /var/lib.apt/lists/*

RUN set -x \
  && curl -sS -L -O https://github.com/github/hub/releases/download/v${VERSION}/hub-linux-amd64-${VERSION}.tgz \
  && tar xzf hub-linux-amd64-${VERSION}.tgz \
  && ./hub-linux-amd64-${VERSION}/install \
  && rm -rf hub-linux-amd64-${VERSION}*

ENTRYPOINT ["hub"]
CMD ["help"]
