#!/bin/sh

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	cd /var/www/wordpress
	wp core download --allow-root&& \
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=$DB_HOST --allow-root
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMINUSER --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINEMAIL --skip-email --allow-root && \
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root && \
	wp plugin update --all --allow-root
fi

exec /usr/sbin/php-fpm7.3 -F