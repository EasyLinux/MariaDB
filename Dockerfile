FROM alpine:3.11
LABEL author="Serge NOEL <serge.noel@easylinux.fr>" \
      app="MariaDb" \
      version="10.4.12"

RUN apk add mariadb-server \ 
    && mkdir /run/mysqld \
    && chown mysql: /run/mysqld \
    && sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
COPY Files/ /
EXPOSE 3306
VOLUME /var/lib/mysql

CMD ["/usr/local/bin/launch"]
 
