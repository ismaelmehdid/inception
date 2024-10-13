#!/bin/bash

mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then # Check if the base db files for mariadb exist
    mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db
fi

WPDBLOGIN=$(cat /run/secrets/wpdblogin)
WPDBNAME=$(cat /run/secrets/wpdbname)
WPDBPASSWORD=$(cat /run/secrets/wpdbpassword)
DBROOTLOGIN=$(cat /run/secrets/dbrootlogin)
DBROOTPASSWORD=$(cat /run/secrets/dbrootpassword)

sed -i "s/\$WPDBLOGIN/${WPDBLOGIN}/g"           /usr/local/bin/wpdb-init.sql
sed -i "s/\$WPDBPASSWORD/${WPDBPASSWORD}/g"     /usr/local/bin/wpdb-init.sql
sed -i "s/\$WPDBNAME/${WPDBNAME}/g"             /usr/local/bin/wpdb-init.sql
sed -i "s/\$DBROOTLOGIN/${DBROOTLOGIN}/g"       /usr/local/bin/wpdb-init.sql
sed -i "s/\$DBROOTPASSWORD/${DBROOTPASSWORD}/g" /usr/local/bin/wpdb-init.sql

exec mysqld --init-file=/usr/local/bin/wpdb-init.sql