#!/bin/bash

set -eu

username=$USER
host=$HOST

echo "Deploying..."

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  $username@$host \
  mkdir -p site

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  $username@$host \
  mkdir -p conf

scp -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  target/photo-blog.tar.gz $username@$host:

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  $username@$host \
  tar -xzf photo-blog.tar.gz -C site/

scp -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  conf/nginx.conf $username@$host:conf

scp -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  docker-compose.yml $username@$host:

scp -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  start.sh $username@$host:

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  $username@$host \
  sh start.sh
