FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb_setup.sh /tmp/mariadb_setup.sh

RUN chmod +x /tmp/mariadb_setup.sh

ENTRYPOINT [ "sh", "/tmp/mariadb_setup.sh" ]