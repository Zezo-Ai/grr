#!/bin/bash

set -ex

echo "** Creating default DB for GRR and fleetspeak"

mysql -u root -p"$MYSQL_ROOT_PASSWORD" --execute \
"CREATE USER'$GRR_DB_USER'@'$MYSQL_ROOT_HOST' IDENTIFIED BY '$GRR_DB_PASSWORD';
CREATE DATABASE $GRR_DB;
GRANT ALL ON $GRR_DB.* TO '$GRR_DB_USER'@'$MYSQL_ROOT_HOST';
CREATE USER '$FLEETSPEAK_DB_USER'@'$MYSQL_ROOT_HOST' IDENTIFIED BY '$FLEETSPEAK_DB_PASSWORD';
CREATE DATABASE $FLEETSPEAK_DB;
GRANT ALL ON $FLEETSPEAK_DB.* TO '$FLEETSPEAK_DB_USER'@'$MYSQL_ROOT_HOST';
FLUSH PRIVILEGES;"

echo "** Finished creating DBs and users"
