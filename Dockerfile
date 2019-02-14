FROM alpine:3.8
LABEL Author="Serge NOEL <serge.noel@easylinux.fr>"

# Environments
ENV TIMEZONE Europe/Paris
# Passer ces variables lors du premier lancement du container, sinon, ce sera les valeurs ci-bas
ENV MYSQL_DATABASE=Default
ENV MYSQL_USER=Default
ENV MYSQL_PASSWORD=ChangeMe
ENV MYSQL_ROOT_PASSWORD=ChangeMe

ADD launch-db /usr/local/bin/launch-db

RUN apk update \
    && apk add mariadb mariadb-client \
    && apk add --update tzdata \
    && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && chmod a+x /usr/local/bin/launch-db \
    && mkdir /run/mysqld \
    && chown mysql: /run/mysqld

# Expose ports
EXPOSE 3306

VOLUME ["/var/lib/mysql"]

# Entry point
ENTRYPOINT ["/usr/local/bin/launch-db"]
