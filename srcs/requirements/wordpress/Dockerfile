FROM debian:bullseye

WORKDIR /var/www/html
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y php7.4 php-fpm php-mysql wget curl default-mysql-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --path=/var/www/html --allow-root

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wordpress_setup.sh /tmp/wordpress_setup.sh

RUN chmod +x /tmp/wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/wordpress_setup.sh" ]