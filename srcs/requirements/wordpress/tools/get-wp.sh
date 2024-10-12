#!/bin/bash

if [ -z "$(ls -A /var/www/html)" ]; then
    cp -R /usr/src/wp/wordpress/* /var/www/html/
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
    echo "Copied WordPress files to /var/www/html and set permissions."
else
    echo "/var/www/html is not empty. Didn't copy any WordPress files."
fi
