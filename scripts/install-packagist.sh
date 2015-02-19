#!/bin/bash
set -e
source /build/buildconfig
set -x

$minimal_apt_get_install curl git nginx php5-fpm php5-cli php5-intl php5-json php5-curl daemontools

if [ ! -d /var/www ]; then
  mkdir -p /var/www
fi

git clone https://github.com/drupal-composer/drupal-packagist.git /var/www/packagist

sed -e 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
sed -e 's/;listen\.owner/listen.owner/' -i /etc/php5/fpm/pool.d/www.conf
sed -e 's/;listen\.group/listen.group/' -i /etc/php5/fpm/pool.d/www.conf
printf "\ndaemon off;\n" >> /etc/nginx/nginx.conf

cp /build/config/vhost.conf /etc/nginx/sites-enabled/default
cp -R /build/service /etc/
cp -R /build/config /var/www/packagist/app/
