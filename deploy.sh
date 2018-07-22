#!/bin/bash

set -eu

echo "Uploading files ..."
aws s3 cp _site/ s3://crispinto.com/ --recursive
