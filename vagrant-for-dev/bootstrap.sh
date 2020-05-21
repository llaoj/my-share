#!/usr/bin/env bash
set -vx

sed -ri "s/(archive|security).ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list 
apt-get update
apt-get install -y nginx

if ! [ -L /var/www/html ]; then
    rm -rf /var/www/html
    ln -fs /vagrant /var/www/html
fi