#!/bin/bash

# Copy config files
cp docker-compose.override.yml.dist docker-compose.override.yml
cp app/drupal/.env.dist app/drupal/.env
cp app/drupal/web/sites/default/default.settings.php.dist app/drupal/web/sites/default/settings.php

# Build dockers
docker-compose up -d --build

# Build drupal app
docker-compose exec -T apache ./build/install.sh

