FROM jjconsumer/baseimage:Ubuntu-14.04
MAINTAINER Reuben Avery <ravery2@its.jnj.com>

ENV HOME /root
RUN mkdir /build
ADD . /build

# Expose ports.
EXPOSE 22
EXPOSE 80
EXPOSE 3306

ENV MYSQL_DATABASE_NAME "packagist"
ENV PACKAGIST_HOST "packagist"

RUN /build/scripts/prepare.sh && \
  /build/scripts/install-mysql.sh && \
  /build/scripts/install-packagist.sh && \
  /build/scripts/install-composer.sh && \
  /build/scripts/exec-composer-install.sh && \
  /build/scripts/cleanup.sh

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

