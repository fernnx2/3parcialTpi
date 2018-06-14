FROM mysql

MAINTAINER fernando Alejandro jayson

ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=mantenimiento

ADD mantenimiento.sql /docker-entrypoint-initdb.d/
CMD ["mysqld"]
EXPOSE 3306


