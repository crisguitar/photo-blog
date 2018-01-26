#!/bin/bash

set -e

docker run -w /code -v $(pwd):/code jekyll/jekyll jekyll build

mkdir -p target

tar -czvf target/photo-blog.tar.gz -C _site .
