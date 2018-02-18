#!/bin/bash

post_title=$1
post_date=$2
post_image=$3
location=$4

cat << EOF
---
layout: post
title:  $post_title
date:   $post_date 00:00:00 +0100
categories: photo
image:
  url: /photos/$post_image
  alt: $post_title
  title: $post_title
location: $location
---

EOF
