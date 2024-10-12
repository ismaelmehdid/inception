FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY ./tools/wpdb-script.sh /usr/local/bin/wpdb-script.sh
COPY ./tools/wpdb-init.sql /usr/local/bin/wpdb-init.sql

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /usr/local/bin/wpdb-script.sh && chmod +x /usr/local/bin/wpdb-script.sh

ENTRYPOINT ["/usr/local/bin/wpdb-script.sh"]
