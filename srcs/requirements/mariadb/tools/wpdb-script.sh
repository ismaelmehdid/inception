#!/bin/bash

mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then # Check if the base db files for mariadb exist
    mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db
fi

exec mysqld --init-file=/usr/local/bin/wpdb-init.sql # to move to dockerfile ? check correction sheet