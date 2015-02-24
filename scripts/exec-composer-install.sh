#!/bin/bash
set -e
source /build/buildconfig
set -x

set +e
cd  /var/www/packagist
composer install --no-interaction --no-dev --prefer-dist

exit 0
