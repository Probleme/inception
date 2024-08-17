#!/bin/sh

# check if WordPress is already installed
if [ -f /var/www/wp-config.php ]; then
    echo "WordPress is already installed."
    exit 0
fi
# this command will start the php-fpm process
service php7.4-fpm start
# this command will wait for 10 seconds before executing the next command
sleep 10
# these variables are used to configure the WordPress installation
WP_PATH=/var/www/html
# this command will create the wp-config.php file with the database credentials
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --path=/var/www/html --skip-email --allow-root
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --path=/var/www/html --allow-root
# this command will change the owner of the /var/www directory to www-data user and group
chown -R www-data:www-data /var/www
# this command will stop the php-fpm process
service php7.4-fpm stop
# this command will keep the container running and the php-fpm process will be the main process
php-fpm7.4 -F
