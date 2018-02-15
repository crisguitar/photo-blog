#!/bin/bash

set -e

green="\033[0;32m"
nc='\033[0m'

docker-compose stop
docker-compose rm -f

echo "removing old files ..."
rm -rf site
rm -rf conf
mkdir -p site
mkdir -p conf
echo -e "removing old files ... ${green}done"

echo "unpacking ..."
tar -xzf deploy/photo-blog.tar.gz -C site/
mv deploy/nginx.conf conf/nginx.conf
echo -e "unpacking ... ${green}done"

docker-compose up -d
