# Drupal 9 startkit

  Help 

## Why ?


## Requirements

- Apache 2.4
- PHP 7.4
- MySQL 5.7
- Composer
- Drush
- Docker

Installation
------------

## Initialization from docker
1. Run install command
```
make install
```

2. Import database from host
```
./bin/db_import.sh YOUR_MYSQL_FILE_NAME.sql
 # you can do it inside of your apache container
drush sqlc < build/mysql/YOUR_MYSQL_FILE_NAME.sql
```

## Docker config override (optionnel)
You can override your docker-compose on `docker-compose.override.yml`

## Installation Front-end
```sh
PROD:
# install dependencies (yarn install --production && gulp --production)
On folder: app/drupal/web/themes/custom/oise_theme/src -> npm run start:prod
```
```sh
DEV:
# install dependencies (yarn and gulp)
On folder: app/drupal/web/themes/custom/oise_theme/src -> yarn run start:dev
```
For more information, you see the README (app/drupal/web/themes/custom/bcm_core/src/README.md)

Configuration
-------------
1. Global settings
settings file app/drupal/.env


| Parameter        | Description            | Default value |
| :--------------- |:-----------------------| :-----|
| MYSQL_DATABASE   | database name          | oise_dev |
| MYSQL_USER       | database user name     | - |
| MYSQL_PASSWORD   | database user password | - |
| MYSQL_HOSTNAME   | database host          | mysql |
| MYSQL_PORT       | database port          | 3306 |
| HASH_SALT        | Salt for one-time login links, cancel links, form tokens, etc | - |

To generate your own salt
```
 # You can genenrate your own hash by executing this drush command
 drush php-eval 'echo \Drupal\Component\Utility\Crypt::randomBytesBase64(55)' > salt.txt
```

2. Local development environment settings. To enable the overriding, you just need to copy web/sites/settings.local.php into web/sites/default folder and rename it settings.local.php
```
cp web/sites/example.settings.local.php web/sites/default/settings.local.php
```

Troubleshooting
---------------
/

FAQ
---
## Export database from docker container
```
// Inside of drupal container
cd /var/web/app/drupal/web
drush sql-dump > /tmp/drupal_dev_latest.sql
```

Usage
-----

#### Cron
/

#### CLI
/

#### Running Tests
/

Deploy
-----------
```sh
make deploy
```

Documentation
-------------

## Docker operations
### Launch containers
```
make up
```
Or
```
docker-compose up -d
```

### Docker drupal connect
```
make bash_app
```
Or
```
docker-compose exec apache bash
```
### Restart containers
```
make restart
```

### Stop containers
```
make stop
```
Or
```
docker-compose stop
```
### Remove containers
```
make clean
```

## Clean cache
### Clean drupal cache
```
make cache_clean
```
On in container do
```
cd app/drupal/web

drush cr
```


Author / Maintainers
--------------------
- Yann Zhao
