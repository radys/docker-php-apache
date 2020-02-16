#!/bin/bash

docker pull php:7.4-apache
docker build -t radys/php-apache:7.4 .
