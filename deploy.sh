#!/bin/bash

set -eu

username=$USER
host=$HOST
green="\033[0;32m"
nc='\033[0m'

upload_file() {
 file=$1
 destination=$2
 scp -q \
   -o UserKnownHostsFile=/dev/null \
   -o StrictHostKeyChecking=no \
   $file $username@$host:$destination
}

run_remote_command() {
  command=$1
  ssh -q \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    $username@$host \
    "${command}"
}

echo "Uploading files ..."
run_remote_command "mkdir -p deploy"
upload_file target/photo-blog.tar.gz deploy
upload_file conf/nginx.conf deploy
upload_file bin/start.sh ""
upload_file docker-compose.yml ""
echo -e "Uploading files ... ${green}done${nc}"

echo "Deploying ..."
run_remote_command "sh start.sh"
echo -e "Deploying ... ${green}done${nc}"
