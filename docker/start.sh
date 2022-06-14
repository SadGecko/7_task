#!/bin/bash

docker network create my-wordpress
docker run -d mysql:8 --name my-mysql --restart=unless-stopped --network=my-wordpress -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wp -e MYSQL_USER=wp -e MYSQL_PASSWORD=pass
docker run -d my-wordpress-app --name my-app  --restart=unless-stopped --network=my-wordpress -p 8080:80