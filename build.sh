#!/bin/bash

set -e

echo "Packaging site..."

echo "contents"
ls -l

echo "current directory"
pwd

docker run -w /code -v $(pwd):/code jekyll/jekyll jekyll build

mkdir -p target

tar -czvf target/photo-blog.tar.gz -C _site .
