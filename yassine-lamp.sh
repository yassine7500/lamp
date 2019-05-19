#! /bin/bash

DIR=$(cd `dirname $0` && pwd)

#log config file
. "$DIR/config/conf.env"

#Check if yassine7500/lamp is installed
#if docker images yassine7500/lamp | grep -q 'fauria';then
#        echo "yassine7500/lamp is already installed";
#    else
#        echo 'pulling yassine7500/lamp from repo';
#        docker pull yassine7500/lamp
#fi


#check if the base directories exist and create them if not
if [ ! -d "$DIR/www" ];then
    mkdir "$DIR/www"
fi
if [ ! -d "$DIR/log" ];then
    mkdir "$DIR/log"
    mkdir "$DIR/log/mysql"
    mkdir "$DIR/log/httpd"
fi
if [ ! -d "$DIR/lib" ];then
    mkdir "$DIR/lib"
    mkdir "$DIR/lib/mysql"
fi

if [ ! -d "$DIR/config" ];then
    mkdir "$DIR/config"
    mkdir "$DIR/config/apache2"
    mkdir "$DIR/config/apache2/sites-enabled"
fi

docker run -p 80:$APACHE_HTTP_PORT -p443:$APACHE_HTTPS_PORT \
-v $APP_DIR:/var/www/html \
-v $APACHE_SITES_ENABLED:/etc/apache2/sites-enabled \
-v $APACHE_CONF_ENABLED:/etc/apache2/conf-enabled \
-v $LOG_HTTPD:/var/log/apache2 \
-v $LOG_MYSQL:/var/log/mysql \
-v $LIB_MYSQL:/var/lib/mysql \
yassine7500/lamp
