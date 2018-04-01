#!/bin/bash

set -e

echo "Packaging site..."
rm -rf target

bundle install && bundle exec jekyll build

mkdir -p target

tar -czf target/photo-blog.tar.gz -C _site .
