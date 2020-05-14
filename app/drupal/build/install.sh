#!/bin/bash

cd /var/web/app/drupal

# Install vendors
composer install

# Update rights
chown -R www-data: .

# drupal site install with database tables generation
drush site:install --account-pass=kernix --site-name=kernix
