#!/bin/bash

set -e

echo "Packaging site..."
rm -rf target

bundle install && jekyll build

mkdir -p target

tar -czvf target/photo-blog.tar.gz -C _site .
