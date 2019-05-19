Based on ubuntu 18.04, this docker container offers a last generation LAMP stack with php 7.3 and support for the principal php components.

The image can be pulled with this command: `docker pull yassine7500/lamp`

After downloading the image, you can run it with the following command

`
docker run -d -p HOST_HTTP_PORT:80 -p HOST_HTTPS_NUMBER:443 -p HOST_MYSQL_PORT:3306 \
-v  HOST_APP_DIR:/var/www/html \
-v  HOST_DB_DIR:/var/www/html \
-v  HOST_APACHE_LOG_DIR:/var/log/apache2 \
-v  HOST_MYSQL_LOG_DIR:/var/log/mysql \
yassine7500/lamp
`

Or you can simply clone this repository and run the `./yassine-lamp.sh` script.
The script will pull the container, create a basic folder structure for the project and run the container with that configuration.
You can change the sript's variables (ports, paths, etc..) in `/config/conf.env`
