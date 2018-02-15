#!/bin/bash

echo "Title [Enter]: "
read post_title
echo "Date (ex: 2018-01-26) [Enter]: "
read post_date
echo "Image name (ex: pepe.jpg) [Enter]: "
read post_image
echo "Location (ex: Pune - India) [Enter]: "
read location

post_filename=$post_date-$(echo $post_title | \
  awk '{gsub(/ /,"_"); print tolower($0)}').markdown

./bin/generate-post.sh "$post_title" "$post_date" "$post_image" "$location" \
  > _posts/$post_filename
