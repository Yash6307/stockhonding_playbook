#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating package index..."
apt-get update -y

echo "Installing dependencies..."
apt-get install -y \
    curl \
    gnupg2 \
    ca-certificates \
    lsb-release \
    ubuntu-keyring

echo "Installing NGINX..."
apt-get install -y nginx

echo "Enabling and starting NGINX..."
systemctl enable nginx
systemctl start nginx

echo "Installing Ruby 3.1 dependencies..."
apt-get install -y \
    software-properties-common \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libreadline-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    libffi-dev \
    git

echo "Adding Brightbox Ruby repository..."
apt-add-repository ppa:brightbox/ruby-ng -y

echo "Updating package index..."
apt-get update -y

echo "Installing Ruby 3.1..."
apt-get install -y ruby3.1 ruby3.1-dev

echo "Verifying installations..."
nginx -v
ruby -v

echo "Installing Bundler..."
gem install bundler

echo "NGINX and Ruby 3.1 installation completed successfully!"
