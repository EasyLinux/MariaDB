FROM alpine:3.9
LABEL author="Serge NOEL <serge.noel@easylinux.fr>" \
      app="MariaDb" \
      version="10.3"

RUN apk add mariadb 
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
COPY Files/ /
EXPOSE 3306
VOLUME /var/lib/mysql
RUN ln -s /dev/stderr /var/log/mysql.err

CMD /usr/local/bin/launch
 
