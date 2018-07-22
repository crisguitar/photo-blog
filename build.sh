#!/bin/bash

set -e

echo "Packaging site..."
rm -rf _site

bundle install && bundle exec jekyll build
