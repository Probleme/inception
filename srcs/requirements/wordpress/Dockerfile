FROM debian:bullseye
# this command is used to set the working directory for the container
WORKDIR /var/www/html
RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install -y php7.4 php-fpm php-mysql wget curl default-mysql-client

# Downloading wp-cli and setting it up
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Making the file executable and moving it to the bin directory
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# Downloading WordPress and setting it up
RUN wp core download --path=/var/www/html --allow-root
# Copying the php-fpm configuration file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
# Copying the script that will be executed when the container starts
COPY ./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
# Making the script executable
RUN chmod +x /tmp/wordpress_setup.sh
# Exposing the port 9000
EXPOSE 9000
# this command is used to set the entry point for the container that means the script will be executed when the container starts
ENTRYPOINT [ "sh", "/tmp/wordpress_setup.sh" ]