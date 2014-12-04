#!/bin/bash
set -e
source /build/buildconfig
set -x

set +e
cd  /var/www/packagist
/usr/share/composer/composer.phar install --no-interaction --no-dev --prefer-dist

exit 0