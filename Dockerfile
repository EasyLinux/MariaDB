FROM debian:buster
LABEL author="Serge NOEL <serge.noel@easylinux.fr>" \
      app="MariaDb" \
      version="10.3.25"

RUN apt-get update \
    && apt-get install -y mariadb-server 
RUN chown -R mysql: /var/log/mysql \
    && rm /var/log/mysql/error.log \
    && ln -s /dev/stdout /var/log/mysql/error.log \
    && rm -rf /var/lib/mysql/*
    
COPY Files/ /
EXPOSE 3306
VOLUME /var/lib/mysql

CMD ["/usr/local/bin/launch"]
 
