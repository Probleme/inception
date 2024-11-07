#!/bin/sh

# check if WordPress is already installed
# if [ -f /var/www/wp-config.php ]; then
#     echo "WordPress is already installed."
#     exit 0
# fi
# # Ensure the /run/php directory exists
# if [ ! -d /run/php ]; then
#     mkdir -p /run/php
# fi
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
echo "MYSQL_ROOT_PASSWORD: $MYSQL_ROOT_PASSWORD"


WP_PATH=/var/www/html
mkdir -p $WP_PATH

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

service php7.4-fpm start

if [ ! -f /var/www/html/wp-config.php ]; then

echo "WordPress not found. Downloading WordPress..."

wp core download --path=/var/www/html/ --allow-root

  

# Configure wp-config.php with database credentials

wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

fi

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER_ADMIN --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=$WP_EMAIL_ADMIN --path=/var/www/html --allow-root
wp user create $MYSQL_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --path=/var/www/html --allow-root
# this command will stop the php-fpm process
service php7.4-fpm stop
# this command will keep the container running and the php-fpm process will be the main process
php-fpm7.4 -F
