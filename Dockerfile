FROM phusion/baseimage
MAINTAINER Reuben Avery <ravery2@its.jnj.com>

ENV HOME /root
RUN mkdir /build
ADD . /build

# Expose ports.
EXPOSE 22
EXPOSE 80
EXPOSE 3306

RUN /build/scripts/prepare.sh
RUN /build/scripts/install-mysql.sh
RUN /build/scripts/install-packagist.sh
RUN /build/scripts/install-composer.sh
RUN /build/scripts/exec-composer-install.sh
RUN /build/scripts/cleanup.sh

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

RUN mkdir -p /var/www/packagist/app/cache/dev
RUN mkdir -p /var/www/packagist/app/cache/prod
RUN mkdir -p /var/www/packagist/app/logs

RUN chmod 0777 /var/www/packagist/app/cache/dev
RUN chmod 0777 /var/www/packagist/app/cache/prod
RUN chmod 0777 /var/www/packagist/app/logs

# SSH
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key
