#!/bin/sh

service mysql start

cat /var/lib/mysql/.setup 2> /dev/null

if [ $? -ne 0 ]; then

	mysql -e "CREATE DATABASE $DB_NAME";
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD'";
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'";
	# mysql -e "FLUSH PRIVILEGES";	
	mysql -e "ALTER USER '$DB_ROOT'@'localhost' IDENTIFIED BY '$DB_ROOTPWD'";
	mysql -e "FLUSH PRIVILEGES";
#	mysql $DB_NAME -u$DB_ROOT -p$DB_ROOTPWD;
	touch /var/lib/mysql/.setup
fi

mysqladmin -u$DB_ROOT -p$DB_ROOTPWD shutdown

exec mysqld