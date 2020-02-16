#!/bin/bash

docker pull php:7.2-apache
docker build -t radys/php-apache:7.2 .
