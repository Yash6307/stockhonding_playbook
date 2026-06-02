#!/bin/bash

set -e

echo "======================================"
echo " Updating package repositories"
echo "======================================"

apt-get update -y

echo "======================================"
echo " Installing required packages"
echo "======================================"

apt-get install -y \
    nginx \
    curl \
    gnupg2 \
    ca-certificates \
    lsb-release \
    dos2unix

echo "======================================"
echo " Converting script format"
echo "======================================"

dos2unix "$0" || true

echo "======================================"
echo " Starting NGINX"
echo "======================================"

service nginx start

echo "======================================"
echo " Checking installed versions"
echo "======================================"

nginx -v
ruby -v

echo "======================================"
echo " NGINX status"
echo "======================================"

service nginx status || true

echo "======================================"
echo " Creating test file"
echo "======================================"

mkdir -p /tmp/myfolder
touch /tmp/myfolder/newfile

echo "======================================"
echo " Script completed successfully"
echo "======================================"
