FROM debian:buster

RUN apt-get update && \
	apt-get -y install php7.3 \
	php-mysqli \
	php7.3-fpm \
	mariadb-client \
	curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
			chmod +x wp-cli.phar && \
			mv wp-cli.phar /usr/bin/wp && \
			mkdir -p /var/www/wordpress && \
			chown -R  www-data:www-data /var/www/wordpress/ && \
			chmod -R +x /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/init_wordpress.sh /

RUN mkdir -p /run/php

EXPOSE 9000

ENTRYPOINT ["sh", "init_wordpress.sh"]