#!/bin/bash

docker network create nodeapi

docker run --rm --name mysql -d  --network nodeapi andressandrade/mysql

docker run --rm --name nodeapi -d --network nodeapi andressandrade/nodeapi  

docker run --rm -p 8080:80 -d --network nodeapi  andressandrade/nginx

sleep 5

echo "Acesse: http://localhost:8080"