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

# Export secrets
export WP_ADMIN_LOGIN=$(cat /run/secrets/wpadminlogin)
export WP_ADMIN_PASSWORD=$(cat /run/secrets/wpadminpassword)
export WP_ADMIN_EMAIL=$(cat /run/secrets/wpadminemail)
export WP_DB_NAME=$(cat /run/secrets/wpdbname)
export WP_DB_USER=$(cat /run/secrets/wpdblogin)
export WP_DB_PASSWORD=$(cat /run/secrets/wpdbpassword)
export WP_DB_HOST=$(cat /run/secrets/wpdbhost)

wp core install \
    --url=imehdid.42.fr \
    --title="Inception" \
    --admin_user=$WP_ADMIN_LOGIN \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --path=/var/www/html \
    --allow-root

wp user create \
    $(cat /run/secrets/wpcontributorlogin) \
    $(cat /run/secrets/wpcontributoremail) \
    --role=contributor \
    --user_pass=$(cat /run/secrets/wpcontributorpassword) \
    --path=/var/www/html \
    --allow-root
