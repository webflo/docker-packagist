#!/bin/bash
set -e
source /build/buildconfig
set -x

mkdir -p /usr/share/composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/share/composer
ln -s /usr/share/composer/composer.phar /usr/bin/composer
chmod +x /usr/bin/composer