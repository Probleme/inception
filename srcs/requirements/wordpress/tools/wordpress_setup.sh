#!/bin/sh

mkdir -p /var/www/html

chown -R www-data:www-data /var/www/html

chmod -R 755 /var/www/html

service php7.4-fpm start

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER_ADMIN --admin_password=$WP_PASSWORD_ADMIN --admin_email=$WP_EMAIL_ADMIN --path=/var/www/html --allow-root --skip-email

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --path=/var/www/html --allow-root

service php7.4-fpm stop

php-fpm7.4 -F
