#!/bin/bash
# Start the mysql service
service mariadb start

sleep 5

# Set the root password for mysql
mysql_secure_installation << EOF
n
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
n
n
n
n
EOF
#Create database and user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# give all permissions to the user on the database
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# update privileges to apply on the database
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# exit from mysql
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
# start mysql in the background to keep the container running
mysqld_safe --port=3306 --bind-address=0.0.0.0 --socket=/run/mysqld/mysqld.sock
