FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server mariadb-client
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init_mariadb.sh /

ENTRYPOINT [ "sh", "init_mariadb.sh" ]