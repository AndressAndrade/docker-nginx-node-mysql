#!/bin/bash
docker network create nodeapi

docker run -d --rm --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=fullcycle --network nodeapi andressandrade/mysql

sleep 60

docker exec -i mysql mysql -uroot -proot < ./mysql/insert.sql

docker run --rm --name nodeapi -d --network nodeapi andressandrade/nodeapi  

docker run --rm -p 8080:80 -d --network nodeapi  andressandrade/nginx

echo "Acesse: http://localhost:8080"