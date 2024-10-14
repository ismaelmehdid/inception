FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /run/php && \
    sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf
    # sed is a command to modify text files, -i is for in place and 's|' for subsitution

RUN mkdir -p /usr/src/wp
WORKDIR /usr/src/wp
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install wget -y && \
    wget https://wordpress.org/wordpress-6.4.tar.gz && \
    tar -xf wordpress-6.4.tar.gz && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp-config.php  /usr/local/bin/
COPY ./tools/get-wp.sh      /usr/local/bin/
RUN chmod +x /usr/local/bin/get-wp.sh

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/get-wp.sh && exec php-fpm7.4 --nodaemonize"]

WORKDIR /