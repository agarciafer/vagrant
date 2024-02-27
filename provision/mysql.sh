#!/bin/bash

yum -y install expect

MARIADB_ROOT_PASS=000000

	SECURE_MYSQL=$(expect -c "
	set timeout 3
	spawn mysql_secure_installation
	expect \"Enter current password for root (enter for none):\"
	send \"\r\"
	expect \"Set root password? \[Y/n\]\"
	send \"y\r\"
	expect \"New password:\"
	send \"${MARIADB_ROOT_PASS}\r\"
	expect \"Re-enter new password:\"
	send \"${MARIADB_ROOT_PASS}\r\"
	expect \"Remove anonymous users? \[Y/n\]\"
	send \"y\r\"
	expect \"Disallow root login remotely? \[Y/n\]\"
	send \"n\r\"
	expect \"Remove test database and access to it? \[Y/n\]\"
	send \"y\r\"
	expect \"Reload privilege tables now? \[Y/n\]\"
	send \"y\r\"
	expect eof
	")

echo "${SECURE_MYSQL}"

yum -y remove expect
mysql -uroot mysql -p$MARIADB_ROOT_PASS <<< "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -uroot mysql -p$MARIADB_ROOT_PASS <<< "FLUSH PRIVILEGES;"

