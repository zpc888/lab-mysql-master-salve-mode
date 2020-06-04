#!/usr/bin/env bash

docker run --name mysql1 -p 33061:3306 -e MYSQL_ROOT_PASSWORD=123 -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
docker run --name mysql2 -p 33062:3306 -e MYSQL_ROOT_PASSWORD=123 -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
