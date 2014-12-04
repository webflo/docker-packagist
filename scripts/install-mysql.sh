#!/bin/bash
set -e
source /build/buildconfig
set -x

$minimal_apt_get_install mysql-server mysql-client

sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf
sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf

echo "mysqld_safe &" > /tmp/config
echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config
echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config
bash /tmp/config
rm /tmp/config
