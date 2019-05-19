#!/bin/bash

cat << EOB
*********************************

yassine/lamp

*********************************
    Server vars:
        Apache Log Level: $APACHE_LOG_LEVEL
        Server Timezone: $TIMEZONE

*********************************
EOB

#start mariadb
service mysql start &

#create user pass to grant access from any host
#mysql -e "CREATE USER IF NOT EXIST 'root'@'%';"&
#mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"&

#start apache
if [ $APACHE_LOG_LEVEL == 'debug' ]; then
    /usr/sbin/apachectl -DFOREGROUND -k start -e debug
else
    &>/dev/null /usr/sbin/apachectl -DFOREGROUND -k start
fi
