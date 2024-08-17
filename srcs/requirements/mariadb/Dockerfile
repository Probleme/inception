FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./tools/mariadb_setup.sh /tmp/mariadb_setup.sh
RUN chmod +x /tmp/mariadb_setup.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/tmp/mariadb_setup.sh" ]