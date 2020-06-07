#!/bin/bash
BASE_PATH=$(dirname $0)

echo "Waiting for mysql to get up"
# Give 60 seconds for master and slave to come up
# sleep 50

echo "create user with all grant permission"
echo `hostname --ip-address`
mysql_host=`hostname --ip-address`
mysql --host mysql_db_container -uroot -p$MYSQL_ROOT_PASSWORD -AN -e "CREATE USER '$MYSQL_USER'@'%'"
mysql --host mysql_db_container -uroot -p$MYSQL_ROOT_PASSWORD -AN -e "GRANT ALL PRIVILEGES ON '$MYSQL_DATABASE'.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
