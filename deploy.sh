#!/bin/bash

set -e

echo "Deploying..."

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  photo-blog@104.131.68.88 \
  mkdir -p site

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  photo-blog@104.131.68.88 \
  mkdir -p conf


scp -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  target/photo-blog.tar.gz photo-blog@104.131.68.88:

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  photo-blog@104.131.68.88 \
  tar -xvzf photo-blog.tar.gz -C site/

scp -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  conf/nginx.conf photo-blog@104.131.68.88:conf

scp -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  docker-compose.yml photo-blog@104.131.68.88:

echo "Starting server..."

ssh -q \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  photo-blog@104.131.68.88 \
  docker-compose up -d
