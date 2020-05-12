#!/usr/bin/env bash
set -vx

sed -ri "s/(archive|security).ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list 
apt-get update
apt-get install -y apache2

if ! [ -L /var/www ]; then
    rm -rf /var/www
    ln -fs /vagrant /var/www
fi