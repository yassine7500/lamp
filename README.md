
### Based on ubuntu 18.04, this docker container offers :
* apache 2.4.29
* mariadb 10.3
* php 7.3 + most common components

##### Pull the image: 
`docker pull yassine7500/lamp`
##### run a basic http container: 
`docker run -d _PORT:80 -v _VOLUME:/var/www/html yassine7500/lamp`
_PORT = the host http port
_VOLUME = the host directory or volume of the project

You can add 
`-p _MYSQL_PORT:3306` to access mysql from host
`-v _MYSQL_VOLUME:/var/lib/mysql` to persist mysql data in host directory or volume

Or you can simply clone this repository and run the `./yassine-lamp.sh` script.

The script will pull the container, create a basic folder structure for the project and run the container with that configuration.

You can change the script's variables (ports, paths, etc..) in `/config/conf.env`
