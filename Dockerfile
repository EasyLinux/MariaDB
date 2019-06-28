FROM alpine:3.9
LABEL author="Serge NOEL <serge.noel@easylinux.fr>" \
      app="MariaDb" \
      version="10.3"

RUN apk add mariadb \ 
    && mysql_install_db --user=mysql --datadir=/var/lib/mysql \
    && mkdir /run/mysqld \
    && chown mysql: /run/mysqld \
    && sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
COPY Files/ /
EXPOSE 3306
VOLUME /var/lib/mysql

CMD /usr/local/bin/launch
 
