#!/bin/bash

cd /var/web/app/drupal

# Install vendors
composer install

# Update rights
chown -R www-data: .
