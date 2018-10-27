#!/bin/bash

set -eu

echo "Uploading files ..."
aws s3 cp _site/ s3://crispinto.com/ --recursive
aws s3 cp _site/archive.html s3://crispinto.com/archive --content-type "text/html"
