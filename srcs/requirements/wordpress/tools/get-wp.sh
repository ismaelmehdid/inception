#!/bin/bash

if [ -z "$(ls -A /var/www/html)" ]; then
    mv /usr/local/bin/wp-config.php /var/www/html/
    cp -R /usr/src/wp/wordpress/* /var/www/html/
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
    rm -rf /usr/src
    echo "Copied WordPress files to /var/www/html and set permissions."
else
    echo "/var/www/html is not empty. Didn't copy any WordPress files."
fi

wp core install --url=https://imehdid.42.fr --title="Inception" --admin_user=usenv --admin_password=usenv --admin_email=usenv@gmail.com --path=/var/www/html --allow-root
wp user create usenv2 usenv2@gmail.com --role=contributor --user_pass=usenv --path=/var/www/html --allow-root
