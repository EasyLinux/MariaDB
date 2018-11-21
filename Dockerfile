FROM alpine:3.8
LABEL Author="Serge NOEL <serge.noel@net6a.com>"

# Environments
ENV TIMEZONE Europe/Bruxelles
ENV MYSQL_ROOT_PASSWORD Secr3t

ADD launch-db /usr/local/bin/launch-db

RUN apk update \
    && apk add mariadb mariadb-client pwgen \
    && apk add --update tzdata \
    && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && chmod a+x /usr/local/bin/launch-db

# Expose ports
EXPOSE 3306

VOLUME ["/var/lib/mysql"]


# Entry point
ENTRYPOINT ["/usr/local/bin/launch-db"]




