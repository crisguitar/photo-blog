#!/bin/bash

set -e

echo "Packaging site..."
rm -rf target

docker run -v $(pwd):/code -w /code ruby bash -c "bundle install && jekyll build"

mkdir -p target

tar -czvf target/photo-blog.tar.gz -C _site .
