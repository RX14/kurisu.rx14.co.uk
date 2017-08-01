# version 1.4-1
# docker-version 0.11.1
FROM        ubuntu:14.04
MAINTAINER  Jim Myhrberg "contact@jimeh.me"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends wget build-essential libssl-dev libperl-dev pkg-config unzip sudo git ca-certificates
  
ENV ZNC_VERSION 1.6.0

RUN \
  mkdir -p /src && \
  cd /src && \
  wget "http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz" && \
  tar -zxf "znc-${ZNC_VERSION}.tar.gz" && \
  cd "znc-${ZNC_VERSION}" && \
  ./configure && make && make install

ENV ZNCSTRAP_VERSION dev

RUN \
  git clone https://github.com/ProjectFirrre/zncstrap/ /zncstrap && \
  cd "/zncstrap" && \
  git checkout dev && \

  rm -Rf /usr/local/share/znc/webskins && \
  rm -Rf /usr/local/share/znc/modules && \
  mv webskins /usr/local/share/znc/ && \
  mv modules /usr/local/share/znc/

RUN         useradd znc
ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default

EXPOSE      6667
ENTRYPOINT  ["/usr/local/bin/start-znc"]
CMD         [""]
